import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/providers/buttomnav_provider.dart';
import 'package:mvvm_provider_dio/services/user_api.dart';
import 'package:mvvm_provider_dio/views/bottomnavmenu/user_screen.dart';
import 'package:mvvm_provider_dio/views/bottomnavmenu/product_screen.dart';
import 'package:mvvm_provider_dio/views/bottomnavmenu/map_screen.dart';
import 'package:mvvm_provider_dio/views/home/custom_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Bottom navbar scren
  static List<StatelessWidget> currenTab = [
    UserScreen(),
    ProductScreen(),
    MapScreen(),
  ];

  // Test Call API service
  // Create Instance
  getUser() async {
    await UserAPIService().getUsers();
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Maps',
            ),
          ],
          onTap: btnNavProvider.updateIndex,
        ),
      ),
    );
  }
}
