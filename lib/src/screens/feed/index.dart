import 'package:flutter/material.dart';
import 'package:sellshop/src/widgets/buttons/category_button.dart';
import 'package:sellshop/src/widgets/listitems/feed_list_item.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('내 동네'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_rounded))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryButton(icon: Icons.menu),
                SizedBox(width: 12,),
                CategoryButton(icon: Icons.search,title: '알바',),
                SizedBox(width: 12,),
                CategoryButton(icon: Icons.home,title:'부동산'),
                SizedBox(width: 12,),
                CategoryButton(icon: Icons.car_crash,title:'중고차'),
                SizedBox(width: 12,),
              ],
            ),
          ),
          Expanded(child: ListView(
            children: [
              FeedListItem(),
              FeedListItem(),
              FeedListItem(),
              FeedListItem(),
              FeedListItem(),
              FeedListItem(),
              FeedListItem(),
            ],
          ))
        ],
      ),
    );
  }
}