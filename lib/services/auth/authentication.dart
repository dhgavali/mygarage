import 'dart:developer';

import 'package:bee/screens/auth_screen/login.dart';
import 'package:bee/screens/auth_screen/otp_page.dart';
import 'package:bee/services/dbmethods.dart';
import 'package:bee/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final storage = new FlutterSecureStorage();
  String? myverificationId;

  get verificationId => this.myverificationId;

  Future<void> storeID(String? id) async {
    print("storing token and data");
    return await storage.write(key: "verification_id", value: id);
  }

  Future<void> storeAuthkey(String? authkey) async {
    return await storage.write(key: "auth_key", value: authkey);
  }

  Future<String?> getId() async {
    return await storage.read(key: "verification_id");
  }

  Future<String?> getAuthKey() async {
    return await storage.read(key: "auth_key");
  }

  Future<void> verifyNumber(
      String phoneNumber, BuildContext context, GlobalKey<State> _keyLoader,
      {bool isResend = false,
      bool isnew = false,
      Map<String, String>? data}) async {
    bool codesent = false;
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      try {
        UserCredential user =
            await _auth.signInWithCredential(phoneAuthCredential);
        if (isnew) {
          DbMethods db = DbMethods();
          if (user.user != null && data != null) {
            data['uid'] = user.user!.uid;

            await db.addData(
              user.user!.phoneNumber!.substring(1),
              data,
            );

            await storeAuthkey(user.user!.uid);
          }
        }
        if (_keyLoader.currentContext != null) {
          Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
        }
        // Navigator.of(context).pushNamed(RouteName.PersistentNavBar);
        Navigator.of(context).pushNamed(RouteName.Select_service_screen);
      } on FirebaseAuthException {
        // print
        // print(e));
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
        showSnackBar(context, "Please retry after some time");
      } catch (e) {
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
        showSnackBar(context, "Please retry after some time");
      }
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      if (exception.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }

      print(exception.toString());
      Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      showSnackBar(
        context,
        exception.toString(),
      );
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int? forceResnedingtoken]) async {
      codesent = true;
      this.myverificationId = verificationID;
      await storeID(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (
      String verificationID,
    ) {
      log("auto retrieval");
      print("auto retrieval");
      Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      if (codesent == true && isnew == false) {
        showSnackBar(context, "Enter code manually");

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpPage(mob_no: phoneNumber)));
      } else {
        showSnackBar(context, "Enter code manually");
      }

      // showSnackBar(context, "Failed to sent code. Please Retry");
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 30),
          phoneNumber: "+91 " + phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInwithPhoneNumber(String verificationId, String smsCode,
      BuildContext context, GlobalKey _keyLoader,
      {bool isnew = false, Map<String, String>? data}) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential user = await _auth.signInWithCredential(credential);
      if (isnew) {
        DbMethods db = DbMethods();
        if (user.user != null && data != null) {
          data['uid'] = user.user!.uid;
          await db.addData(
            user.user!.phoneNumber!.substring(1),
            data,
          );

          await storeAuthkey(user.user!.uid);
        }
      }
      Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      Navigator.of(context).pushNamed(RouteName.Select_service_screen);

      // print("Logged in");
      showSnackBar(context, "logged In");
    } on FirebaseAuthException {
      Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      showSnackBar(context, 'invalid OTP');
    } catch (e) {
      Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> Logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Navigator.of(context).pushAndRemoveUntil(
    await storeID(null);
    await storeAuthkey(null);
    //  MaterialPageRoute(builder: ((context) => LoginPage())), (Route<dynamic> route) => false);
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginPage();
        },
      ),
      (_) => false,
    );
  }
}
