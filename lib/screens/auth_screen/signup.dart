import 'package:bee/screens/auth_screen/login.dart';
import 'package:bee/utils/routes.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static const routeName = "signup";
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Map<String, String> CreateInfo = {
    // it will contain user info after pressing next.
    "email": "",
    "name": "",
    "number": "",
  };
  final _formKey = GlobalKey<FormState>();

  void confirmButton() {
    // confirm button function.
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    print(CreateInfo);
    Navigator.of(context).pushNamed(RouteName.Select_service_screen);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.5, 0],
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
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
              height: size.height * 0.08,
            ),
            Text(
              "Create a New Account !",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 0.3,
                    // shadows: [
                    //   Shadow(),
                    // ],
                  ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Form(
              key: _formKey,
              child: Wrap(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
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
                            radius: 16,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Flexible(
                            child: TextFormField(
                              onSaved: (val) {
                                if (val != null) CreateInfo['number'] = val;
                              },
                              decoration: const InputDecoration(
                                // hintText: "Phone",
                                // hintStyle: TextStyle(
                                //     fontSize: 14, fontWeight: FontWeight.w500),
                                contentPadding: EdgeInsets.only(
                                  left: 14,
                                ),
                                border: InputBorder.none,
                                prefixText: "+91  ",
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: null,
                            ),
                          ),
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
                      borderRadius: BorderRadius.circular(22),
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
                          // const SizedBox(
                          //   width: 6,
                          // ),
                          Flexible(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "One Time Password",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                contentPadding: EdgeInsets.only(
                                  left: 14,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: null,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              splashFactory: InkSparkle
                                  .constantTurbulenceSeedSplashFactory,
                              // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize:
                                  MaterialStateProperty.all(const Size(0, 5)),
                            ),
                            child: Text(
                              "Resend OTP",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                      borderRadius: BorderRadius.circular(22),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: TextFormField(
                        onSaved: (val) {
                          if (val != null) CreateInfo['name'] = val;
                        },
                        validator: (val) {
                          // if (val) {
                          //   return "Enter valid email.";
                          // }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.only(
                            left: 14,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        maxLength: null,
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
                      borderRadius: BorderRadius.circular(22),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: TextFormField(
                        onSaved: (val) {
                          if (val != null) CreateInfo['email'] = val;
                        },
                        validator: (val) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)) {
                            return "Enter valid email.";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.only(
                            left: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        maxLength: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: confirmButton,
              style: ButtonStyle(
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
              ),
              child: Text(
                "SUBMIT",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    letterSpacing: 1,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 22, right: 22, top: 5, bottom: 3),
              child: Text(
                "By signing in you agree to our",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
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
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                ),
                Text(
                  "Don’t have an account?",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => false);
                    Navigator.of(context).pushNamed(RouteName.Login_screen);
                  },
                  style: ButtonStyle(
                    splashFactory:
                        InkSparkle.constantTurbulenceSeedSplashFactory,
                    // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all(const Size(0, 5)),
                  ),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
