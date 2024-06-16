import 'package:board_game_calculator/pages/mighty/player_list.dart';
import 'package:board_game_calculator/pages/mighty/select_pattern.dart';
import 'package:board_game_calculator/pages/mighty/title_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          PlayerList(playerList),
          const TitleBox(title: 'History'),
          history(),
          const TitleBox(title: '문양 설정'),
          const SelectPattern(),
          const TitleBox(title: '주공 설정'),
          const TitleBox(title: '프렌즈 설정'),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '목표 점수',
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(8, (index) {
                    return Container(
                      width: 30,
                      height: 30,
                      color: Colors.grey,
                      child: Center(child: Text('${13 + index}')),
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('여당이 얻은 점수'),
              SizedBox(width: 16.0),
              Container(
                width: 50,
                height: 30,
                color: Colors.grey,
                child: Center(child: Text('16')),
              ),
              SizedBox(width: 16.0),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('SAVE'),
          ),
        ],
      ),
    );
  }
}

Widget playerList() {
  Widget player() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
          left: BorderSide(color: Colors.black, width: 0.5),
          right: BorderSide(color: Colors.black, width: 0.5),
        )),
        alignment: Alignment.center,
        height: 48,
        child: Text('A'),
      ),
    );
  }

  List<Widget> playerList = [player(), player(), player(), player(), player()];

  return Row(
    children: playerList,
  );
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
