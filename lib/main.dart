import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/models/user_manager.dart';
import 'package:fruit_store/screens/base/base_screen.dart';
import 'package:fruit_store/screens/signup/signup_screen.dart';
import 'package:fruit_store/utils/custom_colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
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
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignUpScreen(),
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(),
              );
          }
        },
      ),
    );
  }
}
