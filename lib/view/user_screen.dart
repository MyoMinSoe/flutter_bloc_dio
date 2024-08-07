import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_widget.dart';
import '../model/user.dart';
import '../respository/api_service.dart';
import '../view_model/user_bloc.dart';
import '../view_model/user_event.dart';
import '../view_model/user_state.dart';

class UserScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (c) => UserBloc(apiService)..add(UserLoad()),
      child: const UserListScreen(),
    );
  }
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: LoadingWidget(),
          ));
        } else if (state is UserLoaded) {
          List<User> userList = state.userList;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(
                      '${userList[index].firstName} ${userList[index].lastName}'),
                  subtitle: Text(userList[index].email),
                  trailing:
                      CircleAvatar(child: Text(userList[index].id.toString())),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No State Found'),
          );
        }
      },
    );
  }
}
