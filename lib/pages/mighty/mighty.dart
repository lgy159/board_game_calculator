import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mighty extends StatelessWidget {
  const Mighty({super.key});

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
      body: CounterPage(),
    );
  }
}


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        titleBox(title: 'Player'),
        playerList(),
        titleBox(title: 'History'),
        history(),
        titleBox(title: '문양 설정'),
        selectPattern(),
        titleBox(title: '주공 설정'),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 48,
              width: 72,
              child: Text('주공'),
            ),
            playerList()
          ],
        ),
        titleBox(title: '프렌즈 설정'),
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

Widget titleBox({required String title}) {
  return Container(
    height: 20.0,
    color: Colors.black,
    child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )),
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

Widget selectPattern() {
  Widget pattern(String pattern) {
    return Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: 60,
      width: 60,
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Text(pattern, style: TextStyle(fontSize: 40)),
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      pattern('\u2660'),
      pattern('\u2666'),
      pattern('\u2665'),
      pattern('\u2663'),
      pattern('\u2716'),
    ],
  );
}
