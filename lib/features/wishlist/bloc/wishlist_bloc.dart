import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctest/data/wishlist.dart';
import 'package:bloctest/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<WishlistInitialEvent>((event, emit) {
      emit(WishlistDataLoadedState(wishlistdata: wishlist));
    });

    on<WishlistitemRemoveEvent>(
      (event, emit) {
        print('event called.......');
        // wishlist.remove(event.product);
        wishlist.removeWhere(
            (ProductModel element) => element.id == event.product.id);
        print(wishlist.length);
        emit(WishlistDataLoadedState(wishlistdata: wishlist));
      },
    );
  }
}
