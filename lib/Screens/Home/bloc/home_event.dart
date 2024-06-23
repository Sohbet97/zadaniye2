part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetData extends HomeEvent {
  final String uri;

  GetData({required this.uri});
}

class GetLogin extends HomeEvent {}
