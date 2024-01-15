import 'package:ev_charging_point_app/features/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';
import 'login_state.dart';
class LoginController extends StateNotifier<LoginState>{
  LoginController(this.ref):super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async{

    state = const LoginStateLoading();

    try{
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(email, password);
      state = const LoginStateSuccess();
    } catch (e){
      state = LoginStateError(e.toString());
    }
  }

  // UserModel currentUser() async{
  //
  // }
  
  void signUp(UserModel user) async{
    
    state = const LoginStateLoading();
    
    try{
      await ref.read(authRepositoryProvider).addUser(user);
      state = const LoginStateSuccess();
    } catch (e){
      state = LoginStateError(e.toString());
    }
    
  }

  void logout() async{
    await ref.read(authRepositoryProvider).signOut();
  }

}



final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>((ref){
  return LoginController(ref);
});