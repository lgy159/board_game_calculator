import 'package:board_game_calculator/utils/global_function.dart';
import 'package:board_game_calculator/widgets/buttons/dsbutton_simple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // appbar -s
            Container(
              width: MediaQuery.of(context).size.width,
              height: 235.0,
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
                child: Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/i_dice.png',
                        width: 45,
                        height: 50,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'BoardGame Calculator',
                        style: TextStyle(
                          color: FlutterColor('F1D5C9'),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // appbar -e
            Positioned(
              top: 200,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    DSButtonSimple(
                        pageName: 'SkullKing',
                        urlName: '/skull_king',
                        imageUrl:'assets/images/i_skullking.png'),
                    SizedBox(height: 40.0,),
                    DSButtonSimple(
                        pageName: 'Mighty',
                        urlName: '/mighty',
                        imageUrl:'assets/images/i_mighty.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
