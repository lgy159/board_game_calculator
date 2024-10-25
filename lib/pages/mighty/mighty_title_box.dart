import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  final String title;  // final 키워드를 사용하여 불변으로 만듭니다.

  const TitleBox({required this.title, super.key});  // 생성자에서 this.title을 사용하여 초기화합니다.

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      color: Colors.black,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}