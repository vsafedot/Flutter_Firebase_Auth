import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

   final user = FirebaseAuth.instance.currentUser!;
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Text("Loggen In as :"+ user.email!,
        style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
