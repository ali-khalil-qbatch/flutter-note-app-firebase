import 'package:flutter/material.dart';

int hexToInteger(String hex) => int.parse(hex, radix: 16);

extension StringColorExtensions on String {
  Color toColor() => Color(hexToInteger(this));
}

const emailRegex = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';

void goToScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

void replaceScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
}

void goBack(BuildContext context, [bool? flag = false]) {
  Navigator.of(context).pop(flag);
}
