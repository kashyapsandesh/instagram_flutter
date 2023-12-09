import 'package:flutter/material.dart';
import 'package:instagram_flutter/resources/auth_method.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                await AuthMethods().signOut();
              },
              child: Text(
                'Signout',
                style: TextStyle(color: Colors.white),
              )),
          Center(
            child: Text(
              "I am web sandesh k xa App",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
