import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellshop/src/controllers/feed_controller.dart';

class FeedEdit extends StatefulWidget {
  final Map item;

  const FeedEdit({super.key,required this.item});

  @override
  State<FeedEdit> createState() => _FeedEditState();
}

class _FeedEditState extends State<FeedEdit> {
  final FeedController feedController = Get.find<FeedController>();
  TextEditingController? titleController;
  TextEditingController? priceController;

  void _submit(){
    final item={
      ...widget.item,
      'title':titleController!.text,
      'price':int.tryParse(priceController!.text)??widget.item['price']
    };
    feedController.updateData(item);

    Get.back();
  }

  @override
  void initState(){
    super.initState();
    titleController=TextEditingController(text: widget.item['title']);
    priceController=TextEditingController(text: widget.item['price'].toString());
  }

  @override
  void dispose(){
    titleController?.dispose();
    priceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('물품 수정'),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                )
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                )
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: _submit, child: const Text('수정하기'))
          ],
        ),
      ),
    );
  }
}