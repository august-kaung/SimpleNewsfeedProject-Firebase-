import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/data/apply/news_feed_apply.dart';
import 'package:simple_newsfeed_project_two/data/apply/news_feed_apply_impl.dart';
import 'package:simple_newsfeed_project_two/pages/home_page.dart';
import 'package:simple_newsfeed_project_two/pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NewsFeedApply _newsFeedApply = NewsFeedApplyImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        home: (_newsFeedApply.isLoggedIn())
            ? const HomePage()
            : const LoginPage());
  }
}
