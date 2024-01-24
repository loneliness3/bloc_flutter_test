import 'package:bloctest/data/grecory.dart';
import 'package:bloctest/features/cart/ui/cart_page.dart';
import 'package:bloctest/features/home/bloc/home_bloc.dart';
import 'package:bloctest/features/home/models/home_product_model.dart';
import 'package:bloctest/features/home/ui/widgets/product_cart.dart';
import 'package:bloctest/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        return current is! HomeActionState;
      },
      listener: (context, state) {
        print("here is current state..................${state.runtimeType}");
        switch (state.runtimeType) {
          case HomeNavigateToCartPageActionState:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ));
            break;
          case HomeNavigateToWishListPageActionState:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishListPage(),
                ));
            break;
          case WishListAddedActionState:
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Added to wishlist")));
            break;
          case ExtraPickActionState:
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Already Picked")));
            break;
          case NotiState:
            final notiState = state as NotiState;
            ScaffoldMessenger.of(context)            
                .showSnackBar(SnackBar(content: Text(notiState.message)));
            break;
          default:
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Other State")));
            break;
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            
            return Scaffold(
              backgroundColor: Color.fromARGB(255, 45, 143, 224),
              appBar: AppBar(
                title: const Text("Cart"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                  // IconButton(
                  //     onPressed: () {
                  //       homeBloc.add(NotiEvent());
                  //     },
                  //     icon: Icon(Icons.access_time)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.items.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: successState.items[index],
                      bloc: homeBloc,
                    );
                  }),
            );

          case HomeErrorState:
            return Scaffold();

          default:
            return SizedBox();
        }
      },
    );
  }
}
