import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPattern extends StatefulWidget {
  final void Function(bool) isNoPattern;

  const SelectPattern({required this.isNoPattern, super.key});

  @override
  State<SelectPattern> createState() => _SelectPatternState();
}

class _SelectPatternState extends State<SelectPattern> {
  late void Function(bool) isNoPattern;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    isNoPattern = widget.isNoPattern;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pattern(pattern: '\u2660', color: Colors.black, index: 0),
        pattern(pattern: '\u2666', color: Colors.red, index: 1),
        pattern(pattern: '\u2665', color: Colors.red, index: 2),
        pattern(pattern: '\u2663', color: Colors.black, index: 3),
        pattern(pattern: '\u2716', color: Colors.black, index: 4),
      ],
    );
  }

  Widget pattern({required pattern, required color, required index}) {
    bool isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.yellow : null,
      ),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: 60,
      width: 60,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });

          if (index == 4) {
            widget.isNoPattern(true);
          } else {
            widget.isNoPattern(false);
          }
        },
        child: Text(pattern, style: TextStyle(fontSize: 40, color: color)),
      ),
    );
  }
}
