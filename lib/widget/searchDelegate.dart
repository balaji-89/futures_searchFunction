import 'package:flutter/material.dart';
import 'package:intern_test_1/screen/detailScreen.dart';
import 'package:intern_test_1/widget/single_item_card.dart';
import 'package:provider/provider.dart';
import 'package:intern_test_1/provider/data_provider.dart';

class ItemSearch extends SearchDelegate {
  BuildContext ctx;

  ItemSearch(
    this.ctx,
  );

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    DataModel singleData = Provider.of<Data>(context).searchByTitle(query);
    return InkWell(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return DetailScreen(singleData);
        }));
      },
      child: Center(
        child: SingleItemCard(
          title: singleData.title,
          description: singleData.description,
          meta: singleData.metaData,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    String typedData = query;
    List<DataModel> datum = typedData.isEmpty
        ? Provider.of<Data>(ctx).data
        : Provider.of<Data>(ctx).filterData(typedData);
    return ListView.builder(
      itemCount: datum.length,
      itemBuilder: (context, index) => InkWell(
        onTap:(){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetailScreen(datum[index]);
          }));
        },child:SingleItemCard(
        title: datum[index].title,
        description: datum[index].description,
        meta: datum[index].metaData,
      ),),
    );
  }
}
