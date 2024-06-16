import 'dart:io';
import 'package:board_game_calculator/pages/home/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //화면 방향을 설정하는 부분 (확인 x)
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BoardGameCalculator',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
          // primarySwatch: Colors.blue, //앱 기본 테마
          // textTheme: AppTheme.textTheme, //앱 텍스트 테마 설정
          // platform: TargetPlatform.iOS, // 플랫폼을 ios 스타일로 설정
          ),
      initialRoute: '/',
    );
  }
}