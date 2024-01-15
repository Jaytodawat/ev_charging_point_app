

import 'package:equatable/equatable.dart';

class SignupState extends Equatable{

  const SignupState();

  @override
  List<Object?> get props => [];

}

class SignupStateInitial extends SignupState{
  const SignupStateInitial();

  @override
  List<Object?> get props => [];

}


class SignupStateLoading extends SignupState{
  const SignupStateLoading();

  @override
  List<Object?> get props => [];

}


class SignupStateSuccess extends SignupState{
  const SignupStateSuccess();

  @override
  List<Object?> get props => [];

}

class SignupStateError extends SignupState{
  final String message;
  const SignupStateError(this.message);

  @override
  List<Object?> get props => [message];

}



