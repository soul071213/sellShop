import 'package:flutter/material.dart';
import 'package:sellshop/src/screens/feed/index.dart';
// import 'package:sellshop/src/widgets/modal/more_bottom.dart';

final List<BottomNavigationBarItem> myTabs=<BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home),label: '홈'),
  BottomNavigationBarItem(icon: Icon(Icons.feed),label: '동네'),
  BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded),label: '채팅'),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: '마이'),
];

final List<Widget> myTabItems=[
  const FeedIndex(),
  Center(child: Text('동네'),),
  Center(child: Text('채팅'),),
  Center(child: Text('마이'),),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex=0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: myTabs,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body:IndexedStack(
        index: _selectedIndex,
        children: myTabItems,
      ),
    );
  }
}