import 'package:flutter/material.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 우상단 디버그배너 삭제
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}

