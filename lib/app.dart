import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/app_router.dart';
import 'package:mvvm_provider_dio/providers/buttomnav_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ButtomNavProvider()),
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
