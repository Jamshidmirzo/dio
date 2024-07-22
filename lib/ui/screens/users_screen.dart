import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/blocs/users/users_bloc.dart';
import 'package:lesson81/data/models/user.dart';
import 'package:path_provider/path_provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<UsersBloc>().add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () async {
              final dio = Dio();
              const videoUrl =
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
              final saveTo = await getApplicationDocumentsDirectory();

              dio.download(
                videoUrl,
                "${saveTo.path}/rabbit.mp4",
                onReceiveProgress: (count, total) {
                  print("${(count / total * 100).toStringAsFixed(0)}%");
                },
              );
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is LoadingUsersState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorUsersState) {
            return Center(
              child: Text(state.message),
            );
          }

          List<User> users = [];

          if (state is LoadedUsersState) {
            users = state.users;
          }

          return users.isEmpty
              ? const Center(
                  child: Text("Mavjud emas"),
                )
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatarUrl),
                      ),
                      title: Text("${user.firstName} ${user.lastName}"),
                      subtitle: Text(user.email),
                    );
                  },
                );
        },
      ),
    );
  }
}
