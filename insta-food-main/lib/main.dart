// ignore_for_file: constant_identifier_names

import 'package:firstproject/controller/add_screen_provider.dart';
import 'package:firstproject/controller/edit_screen_provider.dart';
import 'package:firstproject/controller/food_model_provider.dart';
import 'package:firstproject/controller/admin_delete_provider.dart';
import 'package:firstproject/controller/buy_now_provider.dart';
import 'package:firstproject/controller/cart_provider.dart';
import 'package:firstproject/controller/login_provider.dart';
import 'package:firstproject/controller/search_provider.dart';
import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:firstproject/model/newmodel/new_food_model.dart';
import 'package:firstproject/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const SAVE_KEY = ' UserLgedIn';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(CartModelAdapter());
  }

  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(BuynowModelAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(NewFoodModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Adminprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Buynowprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddproductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Editprovider(),
        ),
       
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
