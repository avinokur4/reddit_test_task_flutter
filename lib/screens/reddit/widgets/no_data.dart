import 'package:flutter/material.dart';
import '../actions.dart';

class NoData extends StatelessWidget with FeedActions {
  const NoData();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text("No data here"),
          ),
          Container(
            width: 200,
            child: FlatButton(
              color: Colors.blueAccent,
              height: 50,
              onPressed: () => selectWallet(context),
              child: Center(child: Text('Reload'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
