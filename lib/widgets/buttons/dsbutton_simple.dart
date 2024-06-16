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

  late String? imageUrl;

  DSButtonSimple({
    super.key,
    required this.pageName,
    required this.urlName,
    this.color = '#E7E6E1',
    this.imageUrl,
  });

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 60.0,),
                  imageUrl != null
                      ? Image.asset(
                          imageUrl!,
                          width: 45,
                          height: 45,
                        )
                      : SizedBox(),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      pageName,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context,urlName);
        },
      ),
    );
  }
}
