import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paginnation_teste/controller.dart';
import 'package:paginnation_teste/model.dart';

class TabPages extends StatefulWidget {
  final Controllers controllers;
  final String initiaSearch;

  const TabPages({Key key, this.initiaSearch, this.controllers})
      : super(key: key);
  @override
  _TabPagesState createState() => _TabPagesState();
}

class _TabPagesState extends State<TabPages> {
  Controllers get controller => widget.controllers;
  @override
  void initState() {
    controller.pagingController.addPageRequestListener((pageKey) {
      controller.fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: PagedListView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Datum>(
              itemBuilder: (context, item, index) {
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('${item.id}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}