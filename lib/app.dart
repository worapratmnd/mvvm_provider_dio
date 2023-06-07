import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mvvm_provider_dio/app_router.dart';
import 'package:mvvm_provider_dio/providers/buttomnav_provider.dart';
import 'package:mvvm_provider_dio/viewmodels/product_viewmodel.dart';
import 'package:mvvm_provider_dio/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ButtomNavProvider()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => ProductViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVVM Title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // primaryColor: Colors.blue,
        ),
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
      ),
    );
  }
}
