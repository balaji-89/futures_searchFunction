import 'dart:convert';

import 'package:flutter/material.dart';
import'package:http/http.dart' as http;

class DataModel {
  dynamic id;
  String displayName;
  String title;
  String metaData;
  String description;

  DataModel({
    @required this.id,
    @required this.displayName,
    @required this.title,
    @required this.metaData,
    @required this.description});
}

class Data with ChangeNotifier {
  final url = 'https://sigmatenant.com/mobile/tags';
  List<DataModel> _data = [
  ];

  Future<void> fetchAndSetData() async {
    final response = await http.get(url);
    final fetchedData = json.decode(response.body)['tags'] as List<dynamic>;
     fetchedData.forEach((element) {
      _data.add(
          DataModel(id: element['_id'],
              displayName: element['displayName'],
              title: element['title'],
              metaData: element['meta'],
              description: element['description'])
      );
      return Future.value();
    });
  }

  List<DataModel> get data{
    return [..._data];
  }
   List<DataModel>  filterData(selectedData){
    return [..._data.where((element) => element.title.startsWith(selectedData))];
   }

   DataModel searchByTitle(receivedTitle){
      return _data.firstWhere((element) => element.title.startsWith(receivedTitle));
   }
}
