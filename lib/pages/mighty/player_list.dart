import 'package:board_game_calculator/pages/mighty/mighty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PlayerList extends StatefulWidget {
  final List<String> playerList;
  final Widget Function(int) callBackWidget;
  final Function(int) callBack;

  const PlayerList({
    required this.playerList,
    required this.callBackWidget,
    required this.callBack,
    super.key,
  });

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  late List<String> playerList;
  late Widget Function(int) callBackWidget;
  late int selectedIndex;
  late Function(int) callBack;

  @override
  void initState() {
    super.initState();
    playerList = widget.playerList;
    callBackWidget = widget.callBackWidget;
    callBack = widget.callBack;
    selectedIndex = (callBackWidget(0) is TextField) ? -1 : 0;
  }

  Widget player(int index) {
    return Expanded(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.yellow : Colors.white,
              border: const Border(
                left: BorderSide(color: Colors.black, width: 0.5),
                right: BorderSide(color: Colors.black, width: 0.5),
              )),
          alignment: Alignment.center,
          height: 48,
          child: callBackWidget(index),
        ),
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
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
      children:
          playerList.asMap().entries.map((entry) => player(entry.key)).toList(),
    );
  }
}
