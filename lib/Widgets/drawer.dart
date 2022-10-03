import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://images.mubicdn.net/images/cast_member/3071/cache-3195-1568084972/image-w856.jpg?size=160x";

    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName:
                  Text("Rizwan Ahmed", style: TextStyle(color: Colors.white)),
              accountEmail: Text("rizwan@gmail.com",
                  style: TextStyle(color: Colors.white)),
              // currentAccountPicture: Image.network(imageUrl),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white),
            title: Text("Home",textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text("Profile",textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.white),
            title: Text("Email me",textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
