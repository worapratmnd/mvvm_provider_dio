import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/constants/network_api.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['user']['fullname']),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(NetworkAPI.imageURL +
                    '/profile/' +
                    arguments['user']['img_profile']),
              ),
              SizedBox(height: 16),
              Text(
                '${'Username: ' + arguments['user']['username']}',
                style: TextStyle(fontSize: 24),
              ),
            ],
          )
        ],
      ),
    );
  }
}
