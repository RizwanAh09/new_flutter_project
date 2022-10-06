import 'package:flutter/material.dart';
import 'package:new_flutter_project/Models/catalog.dart';
import 'package:new_flutter_project/Screens/product_details.dart';
import 'package:new_flutter_project/Widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProductDetails(
                    catalog: catalog,
                  );
                },
              ));
            },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image)
                .box
                .rounded
                .p16
                .color(MyThemes.creamColor)
                .make()
                .p16()
                .h40(context)
                .w40(context),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(MyThemes.darkBluish).make(),
              catalog.description.text.textStyle(context.captionStyle).make(),
              15.heightBox, ////SizedBox in Velocity x
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  const AddToCartButton(),
                ],
              ).pOnly(right: 12.0),
            ],
          ))
        ],
      ),
    ).white.square(150).rounded.make().py12();
  }
}

////ADD TO CART BUTTON////

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCartButton> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = true;
          setState(() {});
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(MyThemes.darkBluish),
          shape: const MaterialStatePropertyAll(
            StadiumBorder(),
          ),
        ),
        child: isAdded ? const Icon(Icons.done) : "Add to cart".text.make());
  }
}
