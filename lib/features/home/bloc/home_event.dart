part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  late ProductModel product;
  HomeProductWishlistButtonClickedEvent({required this.product});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeProductWishlistNavigateEvent extends HomeEvent {}

class HomeProductCartNavigateEvent extends HomeEvent {}

class NotiEvent extends HomeEvent {
  // late ProductModel produt;
  // NotiEvent({required this.produt});
}
