import 'package:flutter/material.dart';
import 'package:new_flutter_project/Widgets/themes.dart';

import '../Widgets/cart_widgets/cart_total.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: MyThemes.darkBluish),
        title: Text(
          "My Cart",
          style: TextStyle(
              color: MyThemes.darkBluish,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: _CartItems(),
          ),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class _CartItems extends StatefulWidget {
  const _CartItems({Key? key}) : super(key: key);

  @override
  State<_CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<_CartItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) =>  ListTile(
          leading:  const Icon(Icons.done),
          trailing: IconButton(icon:  const Icon(Icons.remove_circle),
          onPressed: (){},
          ),
          title:  const Text("Product Item"),
        ),
      ),
    );
  }
}
