// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class GetSignUp extends RegisterEvent {
  String? login;
  GetSignUp({required this.login});
}

class LoginIn extends RegisterEvent {
  String? login;
  LoginIn({required this.login});
}

class GetLogin extends RegisterEvent {}
