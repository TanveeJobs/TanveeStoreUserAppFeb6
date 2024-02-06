import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/model/addToCart/addToCart.dart';

class CartWidget extends StatefulWidget {
  int index;
  Function ontap;

  CartWidget({required this.index, required this.ontap});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  AddToCartProvider? carProvider;


@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  carProvider = Provider.of<AddToCartProvider>(context);
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        IconButton(
          onPressed: () => widget.ontap(),
          icon: widget.index == 0
              ? Icon(Icons.shopping_cart, color: Colors.blue)
              : Icon(Icons.shopping_cart_outlined),
        ),
        Visibility(
          visible: carProvider!.cartItemLenght > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Text(
                carProvider!.cartItemLenght.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
