import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:flutter/material.dart';
import './widgets/service_button.dart';

class SelectSOSScreen extends StatelessWidget {
  const SelectSOSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(title: "Select Services"),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 10,
              top: _height * 0.01,
              child: Text(
                "Skip",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
            Positioned(
              top: _height * 0.015,
              child: Text(
                "My Garage",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 36, fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              top: _height * 0.08,
              child: Text(
                "We Keep Your Engine\n Running",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: _height * 0.15,
              child: Text(
                "Welcome!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              top: _height * 0.25,
              left: _width * 0.13,
              child: ServiceButton(
                width: _width,
                height: _height,
                img: 'bike',
                isSos: true,
              ),
            ),
            Positioned(
              top: _height * 0.25,
              right: _width * 0.13,
              child: ServiceButton(
                width: _width,
                height: _height,
                img: 'auto',
                isSos: true,
              ),
            ),
            Positioned(
              top: _height * 0.45,
              left: _width * 0.13,
              child: ServiceButton(
                width: _width,
                height: _height,
                img: 'car',
                isSos: true,
              ),
            ),
            Positioned(
              top: _height * 0.45,
              right: _width * 0.13,
              child: ServiceButton(
                width: _width,
                height: _height,
                img: 'truck',
                isSos: true,
              ),
            ),
            Positioned(
              top: _height * 0.75,
              child: Text(
                "Please Select Any One",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
