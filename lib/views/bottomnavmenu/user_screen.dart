import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/app.dart';
import 'package:mvvm_provider_dio/app_router.dart';
import 'package:mvvm_provider_dio/constants/network_api.dart';
import 'package:mvvm_provider_dio/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  late UserViewModel userViewModel;

  @override
  Widget build(BuildContext context) {
    // init
    userViewModel = Provider.of<UserViewModel>(context, listen: false);
    userViewModel.fetchUsers();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        userViewModel.fetchUsers();
      },
      child: Column(
        children: [
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User List (${DateTime.now().millisecond})'),
                ],
              ),
            ),
          ),
          Consumer<UserViewModel>(
            builder: (context, provider, child) {
              final userList = provider.users;
              return Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    final user = userList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${NetworkAPI.imageURL}/profile/${user.imgProfile!}'),
                      ),
                      title: Text('ID: ${user.id}'),
                      subtitle: Text('Name: ${user.fullname}'),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.userdetail,
                            arguments: {'user': user.toJson()});
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
