import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> content;
  DetailPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${content["name"]}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,),),
            SizedBox(height: 13,),
            Row(
              children: [
                Icon(Icons.location_on_sharp,size: 17,color: Colors.grey,),
                Text(" "),
                Text("${content["location"]}",style: TextStyle(color: Colors.black54, fontSize: 12),),
              ],
            ),
            SizedBox(height: 3,),
            Divider(),
            SizedBox(height: 3,),
            Row(
              children: [
                Icon(Icons.calendar_month,size: 17,color: Colors.grey,),
                Text(" "),
                Text("${content["check"]}",style: TextStyle(color: Colors.black54, fontSize: 12),),
              ],
            ),
            SizedBox(height: 3,),
            Divider(),
            SizedBox(height: 3,),
            Row(
              children: [
                Icon(Icons.notes,size: 17,color: Colors.grey,),
                Text(" "),
                Text("${content["notes"]}",style: TextStyle(color: Colors.black54, fontSize: 12),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}