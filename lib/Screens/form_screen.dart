import 'package:flutter/material.dart';
import 'package:new_flutter_project/Screens/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text(
          "Form",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children:[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: productController ,
                decoration: const InputDecoration(
                  hintText: "Enter Something",
                  labelText: "Enter something",
                  border: OutlineInputBorder(),

                ),

              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
            child:  Text("Submit"),
            style: TextButton.styleFrom(minimumSize: Size(200, 40)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return Details(productName: productController.text,);
                  })
              );
            },
          ),
          ]
        ),
      ),
    );
  }
}
