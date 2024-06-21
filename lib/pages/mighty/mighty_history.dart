import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<List<int>> historys;
  final List<String> playerList;
  final int roundIdx;

  const HistoryList({
    required this.historys,
    required this.roundIdx,
    required this.playerList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: historys
          .map((roundScore) => History(
                roundScore: roundScore,
                roundIdx: roundIdx,
                playerList: playerList,
              ))
          .toList(),
    );
  }
}

class History extends StatefulWidget {
  final List<int> roundScore;
  final List<String> playerList;
  final int roundIdx;

  const History({
    required this.roundScore,
    required this.roundIdx,
    required this.playerList,
    super.key,
  });

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late List<int> roundScore;
  late List<String> playerList;
  late int roundIdx;

  @override
  void initState() {
    super.initState();
    roundScore = widget.roundScore;
    roundIdx = widget.roundIdx;
    playerList = widget.playerList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      height: 32,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
          color: Colors.grey,
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 1),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${roundIdx}. ${playerList[0]} : ${roundScore[0]}, ${playerList[1]} : ${roundScore[1]}, ${playerList[2]} : ${roundScore[2]}, ${playerList[3]} : ${roundScore[3]}, ${playerList[4]} : ${roundScore[4]}',
            style: TextStyle(fontSize: 14),
          ),
          Icon(Icons.delete),
        ],
      ),
    );
  }
}
