import 'package:flutter/material.dart';
import 'package:forage/forage_provider.dart';
import 'package:provider/provider.dart';
import 'detail_page.dart';
import 'forage_page.dart';
import 'item_forage.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(17),
        child: _forageList(context),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ForagePage(),
              ),
            );
          },
          child: 
            Icon(Icons.add),
          ),
      ),
    );
  }

  Widget _forageList(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<ForageProvider>().getForageList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(content: context.watch<ForageProvider>().getForageList[index],),
              ),
            ),
          },
          child: ItemForage(
            content: context.watch<ForageProvider>().getForageList[index],
          ),
        );
      },
    );
  }
}