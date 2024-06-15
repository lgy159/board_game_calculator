import 'package:board_game_calculator/pages/mighty/mighty.dart';
import 'package:board_game_calculator/pages/skull_king/skull_king.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '/pages/home/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final String routeName = settings.name ?? '/';

    switch (routeName) {
      case '/mighty':
        return CupertinoPageRoute(builder: (_) => Mighty());
      case '/skull_king':
        return CupertinoPageRoute(builder: (_) => SkullKing());
      case '/':
        return CupertinoPageRoute(builder: (_) => Home());
      default:
      // 정의되지 않은 모든 경로에 대해 LogIn 페이지로 리다이렉션합니다.
        return CupertinoPageRoute(builder: (_) => Home());
    }
  }
}