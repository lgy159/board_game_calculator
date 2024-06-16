import 'package:board_game_calculator/utils/global_function.dart';
import 'package:board_game_calculator/widgets/buttons/dsbutton_simple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(235.0), // AppBar 높이를 235픽셀로 설정
        child: Container(
          decoration: BoxDecoration(
            color: FlutterColor('#27383F'),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SafeArea(
            child: Center(
              child: Text(
                'BoardGame Calculator',
                style: TextStyle(
                  color: FlutterColor('F1D5C9'),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            DSButtonSimple(pageName: 'mighty', urlName: '/mighty'),
            InkWell(
              child: Text('Mighty'),
              onTap: () {
                Navigator.pushNamed(context, '/mighty');
              },
            ),
            InkWell(
              child: Text('SkullKing'),
              onTap: () {
                Navigator.pushNamed(context, '/skull_king');
              },
            ),
          ],
        ),
      ),
    );
  }
}
