import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_app/domain/entity/product.dart';
import 'package:offline_app/domain/usecase/product_usecase.dart';
import 'package:offline_app/presentation/constants/colors.dart';
import 'package:offline_app/presentation/helpers/responsive.dart';

import 'bloc/home_page_bloc.dart';

part 'widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (context) => HomePageBloc(
        productUseCase: context.read<ProductUseCase>(),
      )..add(const LoadData()),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: const _ProductList(),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state is ProductsLoaded) {
        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              state.products.length,
              (index) => _ProductItem(
                state.products[index],
              ),
            ),
          ),
        );
      }

      return const Center(child: CircularProgressIndicator());
    });
  }
}
