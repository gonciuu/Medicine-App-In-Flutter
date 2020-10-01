import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PlatformSlider extends StatelessWidget {
  final int min, max, divisions, value;
  final Function handler;
  final Color color;

  PlatformSlider(
      {@required this.value,
      @required this.handler,
      @required this.color,
      @required this.max,
      @required this.min,
      @required this.divisions});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSlider(
            onChanged: (value) => this.handler(value),
            max: this.max.toDouble(),
            min: this.min.toDouble(),
            divisions: this.divisions,
            activeColor: Theme.of(context).primaryColor,
            value: this.value.toDouble(),
          )
        : Slider(
            value: this.value.toDouble(),
            onChanged: (value) => this.handler(value),
            max: this.max.toDouble(),
            min: this.min.toDouble(),
            divisions: this.divisions,
            activeColor: this.color,
          );
  }
}
