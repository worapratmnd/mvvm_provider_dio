import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/providers/buttomnav_provider.dart';
import 'package:mvvm_provider_dio/views/bottomnavmenu/first_menu.dart';
import 'package:mvvm_provider_dio/views/bottomnavmenu/second_menu.dart';
import 'package:mvvm_provider_dio/views/bottomnavmenu/third_menu.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Bottom navbar scren
  var currenTab = [
    FirstMenu(),
    SecondMenu(),
    ThirdMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Consumer<ButtomNavProvider>(
          builder: (context, btnNavProvider, child) =>
              Text(btnNavProvider.title),
        ),
      ),
      body: Consumer<ButtomNavProvider>(
          builder: (context, btnNavProvider, child) =>
              currenTab[btnNavProvider.currentIndex]),
      bottomNavigationBar: Consumer<ButtomNavProvider>(
        builder: (context, btnNavProvider, child) => BottomNavigationBar(
          currentIndex: btnNavProvider.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'First',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cabin),
              label: 'Second',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_max),
              label: 'Third',
            ),
          ],
          onTap: btnNavProvider.updateIndex,
        ),
      ),
    );
  }
}
