import 'package:flutter/material.dart';
import 'screens.dart';
import '../screens/reddit/feed.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  Screens.feed: (ctx) => Feed()
};
