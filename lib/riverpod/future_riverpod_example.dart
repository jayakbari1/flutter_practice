import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_5/riverpod/service.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});

class FutureRiverPodExample extends ConsumerWidget {
  const FutureRiverPodExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future RiverPod Example'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(userDataProvider.future),
        child: Consumer(
          builder: (context, ref, child) {
            final data = ref.watch(userDataProvider);
            return data.when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (_, index) {
                            return Card(
                              color: Colors.blue,
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                title: Text(
                                  data[index].firstname,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                subtitle: Text(
                                  data[index].lastname,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                trailing: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    data[index].avatar,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}

//UserModel for the API calling
class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstname: json['first_name'] ?? 'First Name',
        lastname: json['last_name'] ?? 'Last Name',
        avatar: json['avatar'] ??
            'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740');
  }
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
}
