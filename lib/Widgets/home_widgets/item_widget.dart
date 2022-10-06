import 'package:flutter/material.dart';
import 'package:new_flutter_project/Models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: SizedBox(
            height: 100,
            width: 50,
            child: Image.network(item.image),
          ),
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Text(
            "\₹${item.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
