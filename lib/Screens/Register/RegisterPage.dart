import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadaniye2/Screens/Register/bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    _registerBlock.add(GetLogin());
  }

  TextEditingController controller = TextEditingController();
  final _registerBlock = RegisterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _registerBlock;
      },
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is SignUpValidation) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${state.login}"),
            ));
          }

          if (state is SignUpLoading) {
            print('loading');
          }

          if (state is IsRegistered) {
            Navigator.pushReplacementNamed(context, 'home');
          }

          if (state is NotRegistered) {
            print('is not registered');
          }

          if (state is SignUpError) {
            print('error');
          }

          if (state is SignUpLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Вы успешно зарегестрировались"),
            ));
            Navigator.pushReplacementNamed(context, 'home');
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Ваш логин'),
              ),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      "Регистрация",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                onTap: () {
                  if (controller.text.isNotEmpty) {
                    setState(() {
                      _registerBlock.add(GetSignUp(login: controller.text));
                    });
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'author');
                  },
                  child: const Text(
                    "войти",
                    style: TextStyle(letterSpacing: 1),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
