import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/provider/user_provider.dart';
import 'package:instagram_flutter/resources/auth_method.dart';
import 'package:instagram_flutter/models/user_modal.dart' as model;
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String username = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  getUserName() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String user = _auth.currentUser!.uid;
    FirebaseFirestore user_data = FirebaseFirestore.instance;
    DocumentSnapshot snapshot =
        await user_data.collection('users').doc(user).get();

    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)['username'];
    });
    print("user:${username}");
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
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
              user.username,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
