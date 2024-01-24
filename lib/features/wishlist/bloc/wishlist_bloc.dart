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
  }
}
