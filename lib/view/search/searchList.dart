import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/search_controller.dart';
import 'package:hotel/model/room_model.dart';
import 'package:hotel/view/search/demoSearch.dart';

class SearchItem extends SearchDelegate {
  final SearchDataController _findController = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return DemoSearch();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Datum>>(
      future: _findController.searchByTitle(query: query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${data[index].title}"),
                onTap: () {},
              );
            },
          );
        }
      },
    );
  }
}
