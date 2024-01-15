import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import 'auth_provider.dart';

class AuthChecker extends ConsumerWidget{
  const AuthChecker({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(data: (user){
      if(user != null){
        return MainScreen();
      } else {
        return LoginScreen();
      }
    }, error: (e, trace) => LoginScreen(), loading: () => const SplashScreen());
  }

}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}