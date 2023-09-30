import 'package:flutter/material.dart';

class ItemForage extends StatelessWidget {
  final Map<String, String> content;
  ItemForage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${content["name"]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,),),
        Text("${content["location"]}", style: TextStyle(fontSize: 12,),),
        SizedBox(height: 3,),
        Divider(),
      ],
    );
  }
}
