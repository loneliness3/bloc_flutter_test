part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{

}

class WishlistitemRemoveEvent extends WishlistEvent{
  final ProductModel product;
  WishlistitemRemoveEvent({required this.product});
}
