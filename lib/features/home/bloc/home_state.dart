part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List items;
  HomeLoadedSuccessState({required this.items});
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({required this.message});
}

class ExtraPickActionState extends HomeActionState {}

class WishListAddedActionState extends HomeActionState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class NotiState extends HomeActionState {
  final String message;
  final Color bgColor;
  final Icon icon;
  NotiState({required this.message, required this.bgColor, required this.icon});
}
