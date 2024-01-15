import 'package:ev_charging_point_app/features/presentation/providers/signup_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';
import 'login_state.dart';
class SignupController extends StateNotifier<SignupState>{
  SignupController(this.ref):super(const SignupStateInitial());

  final Ref ref;

  // void login(String email, String password) async{
  //
  //   state = const SignupStateLoading();
  //
  //   try{
  //     await ref.read(authRepositoryProvider).signInWithEmailAndPassword(email, password);
  //     state = const SignupStateSuccess();
  //   } catch (e){
  //     state = SignupStateError(e.toString());
  //   }
  // }
  //
  // void logout() async{
  //   await ref.read(authRepositoryProvider).signOut();
  // }

}



// final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>((ref){
//   return LoginController(ref);
// });