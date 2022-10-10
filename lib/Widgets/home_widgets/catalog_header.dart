import 'package:flutter/material.dart';
import 'package:new_flutter_project/Widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Apple Store".text.xl4.bold.color(MyThemes.darkBluish).make(),
        "Trending Products".text.xl.bold.color(MyThemes.darkBluish).make(),
      ],
    );
  }
}
