import 'package:flutter/material.dart';

abstract class AppColor {
  final Color backgroundPrimary;
  final Color backgroundContent;
  final Color backgroundInput;
  final Color textPrimary;
  final Color textSecondary;
  final Color textAlternative;
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconAlternative;
  final Color buttonPrimary;
  final Color buttonDisable;
  final Color buttonSecondary2;
  final Color buttonAlternative;
  final Color blue;
  final Color red;
  final Color green;
  final Color darkGray;

  const AppColor({
    required this.backgroundPrimary,
    required this.backgroundContent,
    required this.backgroundInput,
    required this.textPrimary,
    required this.textSecondary,
    required this.textAlternative,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconAlternative,
    required this.buttonPrimary,
    required this.buttonDisable,
    required this.buttonSecondary2,
    required this.buttonAlternative,
    required this.blue,
    required this.red,
    required this.green,
    required this.darkGray,
  });
}

class AppColorLight implements AppColor {
  @override
  Color get backgroundContent => Colors.white;

  @override
  Color get backgroundInput => const Color.fromRGBO(240, 242, 244, 1);

  @override
  Color get backgroundPrimary => const Color.fromRGBO(227, 232, 235, 1);

  @override
  Color get blue => const Color.fromRGBO(26, 76, 252, 1);

  @override
  Color get buttonAlternative => Colors.white;

  @override
  Color get buttonPrimary => Colors.black;

  @override
  Color get buttonDisable => const Color.fromRGBO(210, 215, 217, 1);

  @override
  Color get buttonSecondary2 => const Color.fromRGBO(240, 242, 244, 1);

  @override
  Color get green => const Color.fromRGBO(85, 252, 26, 1);

  @override
  Color get iconAlternative => Colors.white;

  @override
  Color get iconPrimary => Colors.black;

  @override
  Color get iconSecondary => const Color.fromRGBO(164, 172, 176, 1);

  @override
  Color get red => const Color.fromRGBO(226, 0, 0, 1);

  @override
  Color get textAlternative => const Color.fromRGBO(240, 242, 244, 1);

  @override
  Color get textPrimary => Colors.black;

  @override
  Color get textSecondary => const Color.fromRGBO(164, 172, 176, 1);

  @override
  Color get darkGray => const Color.fromRGBO(60, 64, 66, 1);
}

class AppColorDark implements AppColor {
  @override
  Color get backgroundContent => Colors.white;

  @override
  Color get backgroundInput => const Color.fromRGBO(240, 242, 244, 1);

  @override
  Color get backgroundPrimary => const Color.fromRGBO(227, 232, 235, 1);

  @override
  Color get blue => const Color.fromRGBO(26, 76, 252, 1);

  @override
  Color get buttonAlternative => Colors.white;

  @override
  Color get buttonPrimary => Colors.black;

  @override
  Color get buttonDisable => const Color.fromRGBO(210, 215, 217, 1);

  @override
  Color get buttonSecondary2 => const Color.fromRGBO(240, 242, 244, 1);

  @override
  Color get green => const Color.fromRGBO(85, 252, 26, 1);

  @override
  Color get iconAlternative => Colors.white;

  @override
  Color get iconPrimary => Colors.black;

  @override
  Color get iconSecondary => const Color.fromRGBO(164, 172, 176, 1);

  @override
  Color get red => const Color.fromRGBO(226, 0, 0, 1);

  @override
  Color get textAlternative => const Color.fromRGBO(240, 242, 244, 1);

  @override
  Color get textPrimary => Colors.black;

  @override
  Color get textSecondary => const Color.fromRGBO(227, 232, 235, 1);

  @override
  Color get darkGray => const Color.fromRGBO(60, 64, 66, 1);
}
