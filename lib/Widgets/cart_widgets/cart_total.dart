import 'package:flutter/material.dart';
import 'package:new_flutter_project/Widgets/themes.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$9868",
            style: TextStyle(
                color: MyThemes.darkBluish,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 35,
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Buying not supported yet.")));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(MyThemes.darkBluish)),
              child: const Text("Buy"),
            ),
          ),
        ],
      ),
    );
  }
}
