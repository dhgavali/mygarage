import 'package:bee/screens/auth_screen/otp_page.dart';
import 'package:bee/screens/auth_screen/signup.dart';
import 'package:bee/services/auth/authentication.dart';
import 'package:bee/services/dbmethods.dart';

import 'package:bee/utils/validators.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoginPage extends StatelessWidget {
  static const routeName = "login";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.white],
                begin: FractionalOffset.topLeft,
                transform: GradientRotation(math.pi / -5.5),
                end: FractionalOffset.bottomRight,
                stops: [0.55, 0],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Text(
                      "My Garage",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "We Keep Your Engine\n Running",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Text(
                      "Glad to you here !",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.005,
                        horizontal: size.width * 0.1,
                      ),
                      child: Text(
                        "Login using your mobile number.",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.005,
                        horizontal: size.width * 0.07,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                "icons/flags/png/in.png",
                                package: "country_icons",
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  controller: _controller,
                                  validator: Validators.mobValid,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixText: "+91  ",
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLength: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (this._formKey.currentState!.validate()) {
                          Loadings.showLoadingDialog(context, _keyLoader);

                          DocumentSnapshot res = await DbMethods()
                              .checkUser("91" + _controller.text.toString());
                          print(res.exists);
                          if (res.exists) {
                            final AuthClass _auth = AuthClass();
                            await _auth.verifyNumber(
                                _controller.text.toString(),
                                context,
                                _keyLoader);
                          } else {
                            Navigator.of(_keyLoader.currentContext!,
                                    rootNavigator: true)
                                .pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Account Does not exists")));
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: ((context) => SignupPage())));
                          }
                        }
                      },
                      style: loginBtnStyle(size),
                      child: Text(
                        "GET OTP",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 22, right: 22, top: 5, bottom: 3),
                      child: Text(
                        "By signing in you agree to our",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        "Terms of Service & Privacy Policy",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => SignupPage())));
                        },
                        style: ButtonStyle(
                          splashFactory:
                              InkSparkle.constantTurbulenceSeedSplashFactory,
                          minimumSize:
                              MaterialStateProperty.all(const Size(0, 5)),
                        ),
                        child: Text(
                          "Create",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle loginBtnStyle(Size size) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Colors.red,
      ),
      minimumSize: MaterialStateProperty.all(
        Size(size.width * 0.8, size.height * 0.05),
      ),
      maximumSize: MaterialStateProperty.all(
        Size(size.width * 0.9, size.height * 0.08),
      ),
      elevation: MaterialStateProperty.all(6),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
