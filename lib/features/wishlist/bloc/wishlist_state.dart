part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState {}

class WishlistInitial extends WishlistState {}

class WishlistDataLoadedState extends WishlistState {
  final List wishlistdata;
  WishlistDataLoadedState({required this.wishlistdata});
}


