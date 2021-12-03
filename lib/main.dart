import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/models/cart_manager.dart';
import 'package:fruit_store/models/product.dart';
import 'package:fruit_store/models/product_manager.dart';
import 'package:fruit_store/models/user_manager.dart';
import 'package:fruit_store/screens/base/base_screen.dart';
import 'package:fruit_store/screens/cart/cart.screen.dart';
import 'package:fruit_store/screens/checkout/checkout_screen.dart';
import 'package:fruit_store/screens/home.dart';
import 'package:fruit_store/screens/login/login_screen.dart';
import 'package:fruit_store/screens/products/products_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
              cartManager!..updateUser(userManager),
        )
      ],
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
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen(),
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignUpScreen(),
              );
            case '/products':
              return MaterialPageRoute(
                builder: (_) => ProductsScreen(),
              );
            case '/cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen(), settings: settings);
            case '/home':
              return MaterialPageRoute(
                builder: (context) => HomeScreen(),
              );

            case '/checkout':
              return MaterialPageRoute(
                builder: (_) => CheckoutScreen(),
              );
            case '/':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen(), settings: settings);
          }
        },
      ),
    );
  }
}
