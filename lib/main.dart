import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/screens/base/base_screen.dart';
import 'package:fruit_store/utils/custom_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CColors.primary,
        scaffoldBackgroundColor: CColors.primary,
        appBarTheme: const AppBarTheme(
          color: CColors.primary,
          elevation: 0,
        ),
      ),
      home: BaseScreen(),
    );
  }
}
