import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/bloc/home_bloc.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(GetLogin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is LoadingData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Login) {
          return Center(child: Text('Ваш логин: ${state.login}'));
        } else if (state is ErrorData) {
          return const Center(
            child: Text("error"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
