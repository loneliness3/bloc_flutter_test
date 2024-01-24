import 'package:bloctest/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloctest/features/wishlist/ui/widgets/wishlisticard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wish List Page"),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          listener: (context, state) {},
          builder: (context, state) {
            print(state.runtimeType);
            switch (state.runtimeType) {
              case WishlistDataLoadedState:
                final wishilistDataLoaded = state as WishlistDataLoadedState;
                return wishilistDataLoaded.wishlistdata.length > 0
                    ? ListView.builder(
                        itemCount: wishilistDataLoaded.wishlistdata.length,
                        itemBuilder: (context, index) => WishlistCard(
                            product: wishilistDataLoaded.wishlistdata[index],
                            wishlistBloc: wishlistBloc,
                            ),
                      )
                    : Center(
                        child: Text("No Wish List Yet"),
                      );
              default:
                return SizedBox();
            }

            //  else if (state.runtimeType == WishlistItemRemoveState) {
            //   wishilistDataLoaded = state as WishlistItemRemoveState;
            // }
          },
        ));
  }
}
