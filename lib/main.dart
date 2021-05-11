import 'package:flutter/material.dart';
import 'package:paginnation_teste/controller.dart';
import 'package:paginnation_teste/pageTabs.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PAGINATION'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'One',
            ),
            Tab(
              text: 'Two',
            ),
            Tab(
              text: 'Three',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            TabPages(
              initiaSearch: 'One',
              controllers: Controllers(),
            ),
            TabPages(
              initiaSearch: 'Two',
              controllers: Controllers(),
            ),
            TabPages(
              initiaSearch: 'Three',
              controllers: Controllers(),
            ),
          ],
        ),
      ),
    );
  }
}
