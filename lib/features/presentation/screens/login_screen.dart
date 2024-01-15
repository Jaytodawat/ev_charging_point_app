import 'package:ev_charging_point_app/features/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/login_provider.dart';
import '../providers/login_state.dart';
import '../../../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/reusable_textfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginControllerProvider, (previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LogIn',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please sign in to continue',
                    style: kSubTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                    controller: emailController,
                    labelText: 'Email ID',
                    obsecureText: false,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  ReusableTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    obsecureText: true,
                    icon: const Icon(Icons.lock_open_rounded),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RoundedButton(
                        onPressed: () {
                          ref.read(loginControllerProvider.notifier).login(
                              emailController.text, passwordController.text);
                        },
                        text: 'LOGIN'),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        'Forget Password?',
                        style:
                            kSubTextStyle.copyWith(color: Colors.grey.shade800),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: kSubTextStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          'Sign up',
                          style: kSubTextStyle.copyWith(color: Colors.blue),
                        ),
                      ),
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
