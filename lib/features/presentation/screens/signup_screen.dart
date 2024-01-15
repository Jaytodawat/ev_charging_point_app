import 'package:ev_charging_point_app/features/data/models/user_model.dart';
import 'package:ev_charging_point_app/features/presentation/providers/auth_provider.dart';
import 'package:ev_charging_point_app/features/presentation/screens/login_screen.dart';
import 'package:ev_charging_point_app/features/presentation/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController vehicleController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white60,
                      size: 30,
                    ),
                    padding: const EdgeInsets.all(0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Please fill the input below here',
                    style: kSubTextStyle,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ReusableTextField(
                      controller: nameController,
                      labelText: 'Full Name',
                      obsecureText: false,
                      icon: const Icon(
                        Icons.person,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                      controller: emailController,
                      labelText: 'Email ID',
                      obsecureText: false,
                      icon: const Icon(
                        Icons.email_outlined,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                      controller: mobileController,
                      labelText: 'Mobile No',
                      obsecureText: false,
                      icon: const Icon(
                        Icons.phone_iphone,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      obsecureText: true,
                      icon: const Icon(
                        Icons.lock_open_rounded,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                      controller: vehicleController,
                      labelText: 'Car Name',
                      obsecureText: true,
                      icon: const Icon(
                        Icons.electric_car,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RoundedButton(
                        onPressed: () {
                          ref.read(authRepositoryProvider).addUser(
                                UserModel(
                                    name: nameController.text,
                                    contact: mobileController.text,
                                    carName: vehicleController.text,
                                    email: emailController.text,
                                    password: passwordController.text),
                              );
                          Navigator.pop(context);

                        },
                        text: 'Register'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already registered?",
                        style: kSubTextStyle,
                      ),
                      TextButton(
                          onPressed: () {
                           Navigator.pop(context);
                          },
                          child: Text(
                            'Log In',
                            style: kSubTextStyle.copyWith(color: Colors.blue),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
