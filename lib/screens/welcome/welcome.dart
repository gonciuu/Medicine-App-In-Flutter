import 'package:flutter/material.dart';
import 'package:medicine/helpers/platform_flat_button.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    void goToHomeScreen() => Navigator.pushReplacementNamed(context, "/home");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.04,
            ),
            Image.asset('assets/images/welcome_image.png',
                width: double.infinity, height: deviceHeight * 0.4),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            Container(
              height: deviceHeight * 0.15,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  "Be in control of your meds",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.black, height: 1.3),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.15,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  "An easy-to-use and reliable app that helps you remember to take your meds at the tight time",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.grey[600], height: 1.3),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            Container(
              height: deviceHeight * 0.09,
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: PlatformFlatButton(
                    handler: goToHomeScreen ,
                    color: Theme.of(context).primaryColor,
                    buttonChild: Text(
                      "Get started now",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
