
import 'package:animations/utils/styles.dart';
import 'package:flutter/material.dart';

extension BuildContextExtention on BuildContext {

  TextTheme get textStyles => Theme.of(this).textTheme;

  AppColor get colors => Theme.of(this).brightness == Brightness.light
      ? AppColorLight()
      : AppColorDark();
}