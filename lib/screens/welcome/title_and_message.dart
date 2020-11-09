import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleAndMessage extends StatelessWidget {
  final double deviceHeight;
  TitleAndMessage(this.deviceHeight);
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: deviceHeight * 0.15,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: AutoSizeText(
                "Be in control of your meds",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: Colors.black, height: 1.3),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),
        Container(
          height: deviceHeight * 0.15,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: AutoSizeText(
              "An easy-to-use and reliable app that helps you remember to take your meds at the right time",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.grey[600], height: 1.3,),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
