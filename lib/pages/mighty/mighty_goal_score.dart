import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoalScore extends StatefulWidget {
  final Function(int) callBack;

  const GoalScore({required this.callBack, super.key});

  @override
  State<GoalScore> createState() => _GoalScoreState();
}

class _GoalScoreState extends State<GoalScore> {
  late Function(int) callBack;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    callBack = widget.callBack;
    selectedIndex = 0;
  }

  Widget score(int index) {
    return Expanded(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.yellow : Colors.white,
              border: const Border(
                left: BorderSide(color: Colors.black, width: 0.5),
                right: BorderSide(color: Colors.black, width: 0.5),
                bottom: BorderSide(color: Colors.black, width: 1),
              )),
          alignment: Alignment.center,
          height: 45,
          child: Text('${index + 13}'),
        ),
        onTap: () {
          setState(() {
            selectedIndex = index;
            callBack(index);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(8, (index) => 13 + index)
          .asMap()
          .entries
          .map((entry) => score(entry.key))
          .toList(),
    );
  }
}
