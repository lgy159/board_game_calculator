import 'package:board_game_calculator/pages/mighty/mighty_get_score.dart';
import 'package:board_game_calculator/pages/mighty/mighty_goal_score.dart';
import 'package:board_game_calculator/pages/mighty/player_list.dart';
import 'package:board_game_calculator/pages/mighty/mighty_select_pattern.dart';
import 'package:board_game_calculator/pages/mighty/mighty_title_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Mighty extends StatefulWidget {
  const Mighty({super.key});

  @override
  State<Mighty> createState() => _MightyState();
}

class _MightyState extends State<Mighty> {
  @override
  Widget build(BuildContext context) {
    List<String> playerList = [
      'PlayerA',
      'PlayerB',
      'PlayerC',
      'PlayerD',
      'PlayerE'
    ];

    int mainPlayerIndex = 0;
    int freindPlayerIndex = 0;
    int goalScoreIndex = 0;
    int score = 13;
    bool isNoPattern = false;

    // 티츄비 룰
    int calculate() {
      final goal = goalScoreIndex + 13;
      late int standard;
      if (goal >= score) {
        // 여당 승리 = 공약 + 여당 점수 - (기본 공약(13 - 1 * 2)
        standard = goal + score - 12 * 2;
      } else {
        // 야당 승리 = 공약 - 여당점수
        standard = goal - score;
      }

      return standard;
    }

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
          ),
          const TitleBox(title: 'History'),
          history(),

          const TitleBox(title: '주공 설정'),
          PlayerList(
            playerList: playerList,
            callBackWidget: (int index) {
              mainPlayerIndex = index;
              return Text(playerList[index]);
            } ,
          ),

          const TitleBox(title: '프렌즈 설정'),
          PlayerList(
            playerList: playerList,
            callBackWidget: (int index) {
              freindPlayerIndex = index;
              return Text(playerList[index]);
            } ,
          ),

          const TitleBox(title: '문양 설정'),
          SelectPattern(
            isNoPattern: (result) {
              isNoPattern = result;
            }
          ),

          const TitleBox(title: '목표 점수'),
          GoalScore(selectIndex: goalScoreIndex),

          const TitleBox(title: '얻은 점수'),
          GetScore(getScore: score),

          ElevatedButton(
            onPressed: () {
              // historyList.add(history)
              // A가 가지고 있는 점수 +
            },
            child: Text('SAVE'),
          ),
        ],
      ),
    );
  }
}

List<Widget> historyList = [defaultHistory, defaultHistory, defaultHistory];

Widget defaultHistory = Container(
    padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
    height: 32,
    alignment: Alignment.centerLeft,
    decoration: const BoxDecoration(
        color: Colors.grey,
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        )),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1. A : 10, B : -10, C : -10, D : -10, E : 20',
          style: TextStyle(fontSize: 14),
        ),
        Icon(Icons.delete),
      ],
    ));

Widget history() {
  return Expanded(
    child: ListView(
      children: historyList.map((item) {
        return item;
      }).toList(),
    ),
  );
}
