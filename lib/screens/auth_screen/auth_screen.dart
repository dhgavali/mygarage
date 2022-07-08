import 'package:bee/global_widgets/persistence_nav_bar.dart';
import 'package:bee/screens/auth_screen/login.dart';
import 'package:bee/services/auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      AuthClass().storeAuthkey(FirebaseAuth.instance.currentUser!.uid);
    }

   
    return FirebaseAuth.instance.currentUser != null
        ? PersistentNavBar()
        : LoginPage();
  }
}
