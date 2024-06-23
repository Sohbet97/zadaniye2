// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

class SignUpValidation extends RegisterState {
  String? login;

  SignUpValidation(this.login);
}

class SignUpLoading extends RegisterState {}

class SignUpLoaded extends RegisterState {}

class IsRegistered extends RegisterState {}

class NotRegistered extends RegisterState {}

class SignUpError extends RegisterState {
  String? error;
  SignUpError(this.error);
}
