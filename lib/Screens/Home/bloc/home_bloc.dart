import 'dart:convert';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/Product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetData) {
        emit(LoadingData());

        await Future.delayed(const Duration(seconds: 0), () async {
          final response = await http.get(Uri.parse(event.uri));
          if (response.statusCode == 200) {
            
            var decoded = jsonDecode(response.body);
            List<Product> productList = await decoded
                .map<Product>((json) => Product.fromJson(json))
                .toList();

            if (productList.isEmpty) {
              emit(EmptyData());
            } else {
              emit(LoadedData(productList: productList));
            }
          } else {
            emit(ErrorData(error: "error"));
          }
        }).onError(
          (error, stackTrace) {
            emit(ErrorData(error: error.toString()));
          },
        );
      }

      if (event is GetLogin) {
        emit(LoadingData());
        await Future.delayed(const Duration(seconds: 0), () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          String? login = await preferences.getString('login');
          if (login == null) {
            emit(ErrorData(error: 'error'));
          } else {
            emit(Login(login: login));
          }
        }).onError(
          (error, stackTrace) {
            emit(ErrorData(error: error.toString()));
          },
        );
      }
    });
  }
}
