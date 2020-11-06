import 'package:flutter/material.dart';
import 'package:intern_test_1/widget/single_item_card.dart';

import '../main.dart';
class DetailScreen extends StatelessWidget {
  final selectedData;

  DetailScreen(this.selectedData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedData.title),
        elevation: 5,
        backgroundColor: Theme.of(context).primaryColor,

      ),
      body: SizedBox(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child: Center(
          child: SingleItemCard(
            meta: selectedData.metaData,
            description: selectedData.description,
            title: selectedData.title,
          ),
        ),

      ),
    );
  }
}
