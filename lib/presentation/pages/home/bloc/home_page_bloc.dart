import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:offline_app/domain/entity/product.dart';
import 'package:offline_app/domain/usecase/product_usecase.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({
    required ProductUseCase productUseCase,
  })  : _productUseCase = productUseCase,
        super(const HomePageInitial()) {
    on<LoadData>(_onLoadData);
  }

  final ProductUseCase _productUseCase;

  void _onLoadData(LoadData event, Emitter<HomePageState> emit) async {
    final result = await _productUseCase.getCompleteList();

    result.fold((String error) {}, (List<Product> products) {
      emit(ProductsLoaded(products));
    });
  }
}
