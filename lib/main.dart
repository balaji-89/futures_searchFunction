import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_test_1/provider/data_provider.dart';
import 'package:intern_test_1/widget/searchDelegate.dart';
import 'package:intern_test_1/widget/single_item_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: ChangeNotifierProvider(
        create: (_) => Data(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;

  void initState() {
    isLoading = true;
    super.initState();
    Future.delayed(Duration(
      seconds: 1,
    )).then((value) async {
      await Provider.of<Data>(context, listen: false).fetchAndSetData();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context, listen: false).data;
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.90,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                  onTap: (){
                    showSearch(context: context, delegate: ItemSearch(context));
                  },
                ),
              ),
              isLoading
                  ? CircularProgressIndicator(backgroundColor: Colors.grey)
                  : Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 5),
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, index) =>
                            SingleItemCard(
                                title: data[index].title,
                                meta: data[index].metaData,
                                description: data[index].description),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
