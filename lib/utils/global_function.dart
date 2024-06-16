import 'package:flutter/cupertino.dart';

Color FlutterColor(String color) {
  final buffer = StringBuffer();

  if (color.length == 6 || color.length == 7) buffer.write('ff');

  buffer.write(color.replaceFirst('#', ''));

  return Color(int.parse(buffer.toString(), radix: 16));
}
