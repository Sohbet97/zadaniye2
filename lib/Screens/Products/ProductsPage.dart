import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadaniye2/Screens/Home/bloc/home_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(GetData(uri: "https://fakestoreapi.com/products"));
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
        } else if (state is LoadedData) {
          return ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.productList[index].title.toString(),
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Text(state.productList[index].price.toString()),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundImage: NetworkImage(
                      state.productList[index].image,
                    ),
                    radius: 25,
                  ),
                );
              });
        } else if (state is ErrorData) {
          return const Center(
            child: Text('error'),
          );
        } else {
          return const Center(
            child: Text('asd'),
          );
        }
      }),
    );
  }
}
