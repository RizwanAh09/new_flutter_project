import 'package:flutter/material.dart';
import 'package:new_flutter_project/Screens/dashboard.dart';
import 'package:new_flutter_project/Utils/routs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nameString = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToDashboard(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Navigator.pushNamed(context, "/Login");
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.dashBoardRoute);
       setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hey.png",
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $nameString",
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter user name",
                          border: OutlineInputBorder(),
                          labelText: "User Name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "user name cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          nameString = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length Should be atleast 6";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // ElevatedButton(
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(minimumSize: Size(200, 40)),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, "/Login");
                      //   },
                      // ),

                      InkWell(
                        onTap: () => moveToDashboard(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 40,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // shape: changeButton? BoxShape.circle
                            //     : BoxShape.rectangle,
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
