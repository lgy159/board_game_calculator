import 'package:board_game_calculator/utils/global_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  dropshadow Button
*/


class DSButtonSimple extends StatelessWidget {
  final String pageName;
  final String urlName;
  final String color;

  const DSButtonSimple({super.key, required this.pageName, required this.urlName,this.color = '#E7E6E1'});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
            color: FlutterColor(color),
          ),

          // margin: EdgeInsets.symmetric(horizontal: 30),
        ),
        onTap: (){

        },
      ),
    );
  }
}
