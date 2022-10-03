import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/catalog.dart';
import '../Widgets/drawer.dart';
import '../Widgets/item_widget.dart';
import 'dart:convert';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);////  dummy list
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        title: const Text("Catalog App",
            style: TextStyle(
              color: Colors.black
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)? ListView.builder(
          // itemCount: CatalogModel.items.length,
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            // return ItemWidget(
            //     item: CatalogModel.items[index]);

            return ItemWidget(item: CatalogModel.items[index]);
          },
        ):Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
