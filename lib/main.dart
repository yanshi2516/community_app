import 'package:community_app/ui/main_screen/main_screen.dart';
import 'package:community_app/utils/shared_preferences_helper.dart';
import 'package:community_app/resources/style_resources.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.createInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const MainScreen(),
    );
  }
}