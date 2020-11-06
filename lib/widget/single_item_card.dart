import 'package:flutter/material.dart';
class SingleItemCard extends StatelessWidget {
  final String title;
  final String meta;
  final String description;

  SingleItemCard({
    @required this.title,
    @required this.meta,
    @required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(top:10,left: 3,right: 3),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              spreadRadius: 1.5,
            ),
            BoxShadow(color: Colors.grey[300], spreadRadius: 1.5),
            BoxShadow(color: Colors.grey[500], blurRadius: 2, spreadRadius: 1),
          ]),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              elevation: 5,
              child: Text(
                title,
                style: TextStyle(
                  letterSpacing: 1,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
             meta==null?SizedBox(
               height:constraints.maxHeight*0.035,
             ):Container(
              height: constraints.maxHeight * 0.17,
              width: constraints.maxWidth,
              child: Text(
                meta,
                softWrap: true,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),


              ),
            ),
            Spacer(),
            SizedBox(
              height: meta != null
                  ? constraints.maxHeight * 0.43
                  : constraints.maxHeight * 0.55,
              width: constraints.maxWidth ,
              child: Text(
                description,
                softWrap: true,
                style: TextStyle(
                  fontSize: 17.5,
                  color: Colors.grey,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
                height: constraints.maxHeight*0.15,
                child: Text('Spaces',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize:15,
                      color: Theme.of(context).primaryColor,
                    ))
              )
          ],
        ),
      ),
    );
  }
}
