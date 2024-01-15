import 'package:ev_charging_point_app/constants.dart';
import 'package:ev_charging_point_app/features/presentation/providers/auth_provider.dart';
import 'package:ev_charging_point_app/features/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_model.dart';
import '../providers/index_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<UserModel>(
      future: ref.read(authRepositoryProvider).getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the Future is still running, show a loading indicator.
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // If an error occurs during the Future execution, show an error message.
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // If the Future is completed successfully, display the UI with the data.
          UserModel userModel = snapshot.data!;

          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg'),
                  ),
                  const SizedBox(height: 20),
                  itemProfile('Name', userModel.name, Icons.person),
                  const SizedBox(height: 10),
                  itemProfile('Phone', userModel.contact, Icons.phone),
                  const SizedBox(height: 10),
                  itemProfile(
                      'Car Name', userModel.carName, Icons.electric_car),
                  const SizedBox(height: 10),
                  itemProfile('Email', userModel.email, Icons.mail),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(

                        onPressed: () {
                          ref.read(loginControllerProvider.notifier).logout();
                          ref.watch(indexBottomNavbarProvider.notifier).update((
                              state) => 0);
                        },

                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.blue
                        ),
                        child: Text('Log Out', style: kSubTextStyle.copyWith(
                            color: Colors.white),)
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Text('No user data available.');
        }
      }
    );
  }
}

itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10
          )
        ]
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
      tileColor: Colors.white,
    ),
  );
}

