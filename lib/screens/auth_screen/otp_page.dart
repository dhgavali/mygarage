import 'package:bee/services/auth/authentication.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/routes.dart';

import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class OtpPage extends StatefulWidget {
  final String mob_no;

  const OtpPage({required this.mob_no});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool isEnabled = false;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  late String _myverificationID;

  //authentication class
  late final AuthClass _auth;

  bool _sendOtp = true;

  @override
  void initState() {
    super.initState();
    _mobileNumber.text = widget.mob_no;
    _auth = AuthClass();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.white],
                begin: FractionalOffset.topLeft,
                transform: GradientRotation(math.pi / -7.5),
                end: FractionalOffset.bottomRight,
                stops: [0.6, 0]),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
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
                  "Enter OTP",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.05,
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
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: TextFormField(
                            controller: _mobileNumber,
                            validator: Validators.mobValid,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixText: "+91  ",
                              counterText: "",
                              enabled: isEnabled,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            setState(() {
                              isEnabled = true;
                            });
                          },
                          style: ButtonStyle(
                            splashFactory:
                                InkSparkle.constantTurbulenceSeedSplashFactory,
                            // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize:
                                MaterialStateProperty.all(const Size(0, 5)),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      onTap: () async {},
                      controller: _otpController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        counterText: "",
                        suffix: TextButton(
                          onPressed: () async {
                            Loadings.showLoadingDialog(context, _keyLoader);

                            await _auth.verifyNumber(
                                _mobileNumber.text.toString(),
                                context,
                                _keyLoader);
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: "One Time Password",
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      autofocus: false,
                      cursorColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Loadings.showLoadingDialog(context, _keyLoader,
                        msg: "Verifying OTP", isLogin: true);

                    String? verificationId = await _auth.getId();

                    await _auth.signInwithPhoneNumber(verificationId!,
                        _otpController.text.toString(), context, _keyLoader);
                        
                  },
                  style: loginBtnStyle(size),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10),
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
        Theme.of(context).primaryColor,
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

class Loadings {
  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key,
      {String msg = "Please wait .. Automatically Verifying OTP",
      bool isLogin = false}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.white,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.transparent,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    alignment: Alignment.center,
                    color: Colors.grey.withOpacity(0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        isLogin
                            ? Container()
                            : Container(
                                height: 20,
                                child: TweenAnimationBuilder(
                                  tween: Tween(begin: 30.0, end: 0.0),
                                  duration: Duration(seconds: 30),
                                  builder: (_, dynamic value, child) => Text(
                                    "00:${value.toInt()}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 5,
                        ),
                        Consts.titleText2(text: msg, color: Colors.black),
                      ],
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
