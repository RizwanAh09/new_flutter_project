import 'package:flutter/material.dart';

class Details extends StatelessWidget {
   Details({Key? key,
  required this.productName}) : super(key: key);

  String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details",
        style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back)),
      ),
      body:  Center(child: Text(productName)),
    );
  }
}
