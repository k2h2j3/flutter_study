import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with
SingleTickerProviderStateMixin{
  late TabController controller;
  // bottomtab 인덱스
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    controller = TabController(length: 4, vsync: this);
    
    controller.addListener(tableListner);
  }

  @override
  void dispose() {
    controller.removeListener(tableListner);
    // TODO: implement dispose
    super.dispose();
  }

  void tableListner(){
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: TabBarView(
        //옆으로 스크롤 못하게 하는 기능
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Center(child: Container(child: Text('홈'))),
          Center(child: Container(child: Text('음식'))),
          Center(child: Container(child: Text('주문'))),
          Center(child: Container(child: Text('프로필'))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        // 탭을 눌렀을 때, 약간 올라오는 효과
        type: BottomNavigationBarType.shifting,
        // 현재 인덱스(누른)에 따라 선택됨
        onTap: (int index) {
          setState(() {
            controller.animateTo(index);
          });
        },
        // 현재 인덱스를 저장
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
