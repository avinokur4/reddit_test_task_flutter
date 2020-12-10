import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feed_bloc/feed_bloc.dart';
import 'navigation/routes.dart';
import 'navigation/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

@immutable
class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FeedListBloc()),
        ],
        child: MaterialApp(
          title: 'TestTask',
          initialRoute: Screens.feed,
          routes: appRoutes,
        ));
  }
}
