import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem(this.item, this.selfText);

  final dynamic item;
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 112,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item?.title,
                            ),
                            Text(
                              item.selfText,
                            ),
                          ],
                        ),
                      ],
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
