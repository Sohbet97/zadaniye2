part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

class LoadingData extends HomeState {}

class LoadedData extends HomeState {
  final List<Product> productList;

  LoadedData({required this.productList});
}

class ErrorData extends HomeState {
  final String error;

  ErrorData({required this.error});
}

class EmptyData extends HomeState {}

class Login extends HomeState {
  final String login;
  Login({required this.login});
}
