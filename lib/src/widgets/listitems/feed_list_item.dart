import 'package:flutter/material.dart';

const double _imageSize=110;

class FeedListItem extends StatelessWidget {
  const FeedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network("https://i.namu.wiki/i/yTBEvE3SCplAHVgsUxHxVH9W5IVQ0ldZ0WG25w9ByPreG-0rTQVnhkEjXGN2ynQH_OTYj07in_LYErBkF5zWJj5mlaJ1ZHMIBM9FKJ13Ax2p_GeFldWFICoB7E2_HChtoTvv2w1R2ehjUoDGBQGcfg.webp",width: _imageSize,height: _imageSize,fit: BoxFit.cover,),
                ),
                Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('판매할 물건의 제목',overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16),),
                    Row(
                      children: [
                        Text('동네이름',style: TextStyle(color: Colors.grey),),
                        Text(' 2 분전',style: TextStyle(color: Colors.grey),),
                        
                      ],
                    ),
                    Text('물품 가격',style: TextStyle(fontSize: 16,color: Colors.black),),
                  ],
                ),)),
                IconButton(onPressed: (){}, icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                  size: 16,
                ))
              ],
            ),
            Positioned(
              right: 10,
              bottom: 0,
              child: Row(
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(width: 2,),
                  Text('1',style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 4,),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(width: 2,),
                  Text('1',style: TextStyle(color: Colors.grey),)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}