import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem(this.title, this.selfText);

  final String title;
  final String selfText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(11),
            topLeft: Radius.circular(11),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      selfText,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              indent: 24,
              thickness: 1,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
