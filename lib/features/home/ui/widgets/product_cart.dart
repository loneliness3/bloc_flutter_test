import 'package:flutter/material.dart';

import '../../bloc/home_bloc.dart';
import '../../models/home_product_model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final HomeBloc bloc;
  const ProductCard({super.key, required this.product, required this.bloc});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        shape: Border.all(
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color.fromARGB(255, 9, 51, 113)),
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('./assets/images/boahancock.jpg')),
                  )),
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Color: ${widget.product.color}",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Amount: ${widget.product.amount.toString()}",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.product.price.toString()} /ks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.bloc.add(HomeProductWishlistButtonClickedEvent(
                                product: widget.product));
                          },
                          icon: Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {
                            widget.bloc.add(HomeProductCartButtonClickedEvent());
                          },
                          icon: Icon(Icons.shopping_bag_outlined)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
