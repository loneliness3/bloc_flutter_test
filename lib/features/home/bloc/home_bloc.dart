import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bloctest/data/cartitem.dart';
import 'package:bloctest/data/grecory.dart';
import 'package:bloctest/data/wishlist.dart';
import 'package:bloctest/features/home/models/home_product_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 1));
      emit(HomeLoadedSuccessState(
          items: Grecory.data_list
              .map((e) => ProductModel(
                  id: e['id'],
                  name: e['name'],
                  amount: e['amount'],
                  color: e['color'],
                  price: e['price'],
                  status: e['status']))
              .toList()));
    });

    on<HomeProductWishlistButtonClickedEvent>(
      (event, emit) {
        if (wishlist.contains(event.product)) {
          emit(NotiState(message: "Already Pick",bgColor: Colors.red, icon: Icon(Icons.error)));
          print('already picked.,.......');
        } else {
          wishlist.add(event.product);
          emit(NotiState(message: "Added to WishList", bgColor: Colors.green, icon: Icon(Icons.check_box)));
        }

        // for (var i in wishlist) {
        //   print(i.id);
        //   if (i.id.toString() == event.product.id.toString()) {
        //     print('already picked');
        //   } else {
        //     wishlist.add(event.product);
        //   }
        // }
      },
    );

    on<HomeProductCartButtonClickedEvent>(
      (event, emit) {
        emit(WishListAddedActionState());
        print('$event cart button clicked ..........');
        // emit(NotiState());
      },
    );

    on<HomeProductWishlistNavigateEvent>(
      (event, emit) {
        print('Wish List navigate');
        emit(HomeNavigateToWishListPageActionState());
      },
    );

    on<HomeProductCartNavigateEvent>(
      (event, emit) {
        print('Cart navigate');
        emit(HomeNavigateToCartPageActionState());
      },
    );
  }
}
