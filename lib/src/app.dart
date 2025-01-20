import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sellshop/src/screens/auth/register.dart';
// import 'package:sellshop/src/screens/feed/show.dart';
import 'package:sellshop/src/screens/home.dart';
import 'package:sellshop/src/screens/intro.dart';
// import 'package:sellshop/src/screens/shared/data.dart';
// import 'package:sellshop/src/screens/unknown.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carrot Market',
      routes: {
        '/' : (context) => const Home(),
        '/intro' : (context) => const Intro(),
        '/register' : (context)=> const  Register()
      },
      initialRoute: '/',

      // onGenerateRoute: (route){
      //   if(route.name!.startsWith('/feed/')){
      //     //경로에서 id를 추출하여 변수에 저장
      //     final id = int.parse(route.name!.split('/').last);
      //     //추출한 id에 해당하는 항목을 찾습니다.
      //     final item=FeedList.firstWhere((e)=>e['id']==id);

      //     return MaterialPageRoute(builder: (context)=>FeedShow(item));
      //   }

      //   return MaterialPageRoute(builder: (context)=>const UnknownScreen());
      // },
    );
  }
}