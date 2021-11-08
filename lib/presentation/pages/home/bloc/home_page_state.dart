part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  const HomePageInitial();
  @override
  List<Object?> get props => [];
}

class ProductsLoaded extends HomePageState {
  const ProductsLoaded(this.products);
  final List<Product> products;
  @override
  List<Object?> get props => [];
}
