import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter_project/Utils/routs.dart';
import 'package:new_flutter_project/Widgets/home_widgets/catalog_header.dart';
import 'package:new_flutter_project/Widgets/themes.dart';

import '../Models/catalog.dart';

import '../Widgets/home_widgets/catalog_list.dart';
import '../Widgets/home_widgets/drawer.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
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
      floatingActionButton:FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, MyRoutes.cartRoute);
      },
      child: const Icon(CupertinoIcons.cart),
      backgroundColor: MyThemes.darkBluish),
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              const CatalogHeader(),
              10.heightBox,
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
