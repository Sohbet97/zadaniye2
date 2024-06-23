import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Register/bloc/register_bloc.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  final registerBlock = RegisterBloc();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return registerBlock;
      },
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is IsRegistered) {
            print('registered');
          }

          if (state is NotRegistered) {
            print('is not registered');
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Ваш логин не найден"),
            ));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Войти'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.login),
                      labelText: "Логин"),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: const Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    registerBlock.add(LoginIn(login: controller.text));
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
