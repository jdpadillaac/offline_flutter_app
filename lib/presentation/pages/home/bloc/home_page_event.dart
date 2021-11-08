part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class LoadData extends HomePageEvent {
  const LoadData();
  @override
  List<Object?> get props => [];
}
