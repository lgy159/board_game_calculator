import 'package:board_game_calculator/pages/mighty/mighty_get_score.dart';
import 'package:board_game_calculator/pages/mighty/mighty_goal_score.dart';
import 'package:board_game_calculator/pages/mighty/mighty_history.dart';
import 'package:board_game_calculator/pages/mighty/player_list.dart';
import 'package:board_game_calculator/pages/mighty/mighty_select_pattern.dart';
import 'package:board_game_calculator/pages/mighty/mighty_title_box.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Mighty extends StatefulWidget {
  const Mighty({super.key});

  @override
  State<Mighty> createState() => _MightyState();
}

List<List<int>> historys = [];

class _MightyState extends State<Mighty> {
  List<String> playerList = ['플A', '플B', '플C', '플D', '플E'];

  List<int> playerScore = [0, 0, 0, 0, 0];
  int mightyMainPlayerIndex = 0;
  int mightyFreindPlayerIndex = 0;
  int goalScoreIndex = 0;
  int score = 13;
  bool isNoPattern = false;

  // 티츄비 룰
  int calculate() {
    final goal = goalScoreIndex + 13;
    final double = (isNoPattern) ? 2 : 1;
    return (goal <= score)
        ? (goal + score - 12 * 2 - 1) * double
        : -(goal - score) * double;
  }

  void updateMainIndex(int newData) {
    setState(() {
      mightyMainPlayerIndex = newData;
    });
  }

  void updateFriendIndex(int newData) {
    setState(() {
      mightyFreindPlayerIndex = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이티 카운터'),
        backgroundColor: Colors.grey,
        centerTitle: true,
        actions: [
          Container(
            width: 50,
            height: 30,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Text(
              'Reset',
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleBox(title: 'Player'),
          PlayerList(
            playerList: playerList,
            callBackWidget: (int index) => TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: playerList[index],
              ),
              onChanged: (text) {
                setState(() {
                  playerList[index] = text;
                });
              },
            ),
            callBack: (int idx) {},
          ),
          const TitleBox(title: 'History'),
          HistoryList(
              historys: historys,
              roundIdx: historys.length,
              playerList: playerList),
          const TitleBox(title: '주공 설정'),
          PlayerList(
            playerList: playerList,
            callBackWidget: (int index) {
              return Text(playerList[index]);
            },
            callBack: updateMainIndex,
          ),
          const TitleBox(title: '프렌즈 설정'),
          PlayerList(
            playerList: playerList,
            callBackWidget: (int index) {
              return Text(playerList[index]);
            },
            callBack: updateFriendIndex,
          ),
          const TitleBox(title: '문양 설정'),
          SelectPattern(isNoPattern: (result) {
            isNoPattern = result;
          }),
          const TitleBox(title: '목표 점수'),
          GoalScore(callBack: (int scoreIndex) {
            goalScoreIndex = scoreIndex;
          }),
          const TitleBox(title: '얻은 점수'),
          GetScore(callBack: (int getScore) {
            score = getScore;
          }),
          ElevatedButton(
            onPressed: () {
              final standard = calculate();
              Logger().i("Score goalIndex : $goalScoreIndex");
              Logger().i("Score Standard : $standard");
              final roundScore = [0, 0, 0, 0, 0];
              roundScore.forEachIndexed((idx, element) {
                element += (idx == mightyMainPlayerIndex)
                    ? standard * 2
                    : (idx == mightyFreindPlayerIndex)
                        ? standard
                        : -standard;
                roundScore[idx] += element;
                playerScore[idx] += element;
              });
              setState(() {
                historys.add(roundScore);
              });
            },
            child: Text('SAVE'),
          ),
        ],
      ),
    );
  }
}
