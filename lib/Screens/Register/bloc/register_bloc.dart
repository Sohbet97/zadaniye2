import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is GetLogin) {
        emit(SignUpLoading());

        await Future.delayed(const Duration(seconds: 0), () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          String? login = preferences.getString('login');

          if (login != null) {
            emit(IsRegistered());
          } else {
            emit(NotRegistered());
          }
        }).onError(
          (error, stackTrace) {
            emit(SignUpError(error.toString()));
          },
        );
      }

      if (event is LoginIn) {
        emit(SignUpLoading());

        await Future.delayed(const Duration(seconds: 0), () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          String? login = preferences.getString('login');

          if (login == event.login) {
            emit(IsRegistered());
          } else {
            emit(NotRegistered());
          }
        }).onError(
          (error, stackTrace) {
            emit(SignUpError(error.toString()));
          },
        );
      }

      if (event is LoginIn) {
        emit(SignUpValidation('validation'));
      } else if (event is GetSignUp) {
        emit(SignUpLoading());

        await Future.delayed(const Duration(seconds: 0), () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          await sharedPreferences.setString('login', event.login.toString());
          emit(SignUpLoaded());
        }).onError((error, stactTrace) {
          emit(SignUpError(error.toString()));
        });
      }
    });
  }
}
