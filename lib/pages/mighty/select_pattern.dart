import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPattern extends StatefulWidget {
  const SelectPattern({super.key});

  @override
  State<SelectPattern> createState() => _SelectPatternState();
}

class _SelectPatternState extends State<SelectPattern> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pattern(pattern: '\u2660', color: Colors.black),
        Pattern(pattern: '\u2666', color: Colors.red),
        Pattern(pattern: '\u2665', color: Colors.red),
        Pattern(pattern: '\u2663', color: Colors.black),
        Pattern(pattern: '\u2716', color: Colors.black),
      ],
    );
    ;
  }
}

class Pattern extends StatelessWidget {
  final String pattern;
  final Color color;

  const Pattern({required this.pattern, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: 60,
      width: 60,
      child: InkWell(
        onTap: () {},
        child: Text(pattern, style: TextStyle(fontSize: 40, color: color)),
      ),
    );
  }
}
