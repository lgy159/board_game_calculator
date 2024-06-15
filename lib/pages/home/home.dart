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
    Logger().i('ge');

    return Scaffold(
      appBar: AppBar(
        title: Text('BoardGameCalculator'),
      ),
      body: Container(
        decoration: BoxDecoration(
        ),
        child: Column(
          children: [
            InkWell(
              child: Text('Mighty'),
              onTap: (){
                Navigator.pushNamed(context,'/mighty');
              },
            ),
            InkWell(
              child: Text('SkullKing'),
              onTap: (){
                Navigator.pushNamed(context,'/skull_king');
              },
            ),
          ],
        ),
      ),

    );
  }
}
