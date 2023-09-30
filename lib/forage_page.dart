import 'package:flutter/material.dart';
import 'forage_provider.dart';
import 'package:provider/provider.dart';

class ForagePage extends StatelessWidget {
  var _nameController = TextEditingController();
  var _locationController = TextEditingController();
  var _notesController = TextEditingController();
  bool _checked = false;
  String _season = "";
  ForagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(7),
                  child: SizedBox(
                    width: 300,
                    child:
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        label: Text("Name"),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: SizedBox(
                    width: 300,
                    child:
                    TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        label: Text("Location"),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: SizedBox(
                    width: 300,
                    child:
                    Row(
                      children: [
                        Checkbox(
                          value: context.watch<ForageProvider>().getCheck,
                          onChanged: (value) {
                            context.read<ForageProvider>().click();
                          },
                        ),
                        Text("Currently in season"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: SizedBox(
                    width: 300,
                    child:
                    TextField(
                      controller: _notesController,
                      decoration: InputDecoration(
                        label: Text("Notes"),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: SizedBox(
                          width: 300,
                          child:
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        context.read<ForageProvider>().saveData(_nameController.text,_locationController.text,_notesController.text);
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                      ),
                                      child: Text("SAVE"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        _nameController.clear();
                                        _locationController.clear();
                                        _notesController.clear();
                                        context.read<ForageProvider>().reset();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                      ),
                                      child: Text("DELETE"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}