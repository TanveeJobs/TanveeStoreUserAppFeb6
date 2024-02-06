import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/extention/StringExtention.dart';
import 'package:tanvi/model/addToCart/addToCart.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/cart/CartM.dart';
import 'package:tanvi/widgets/counter_widget.dart';

class VariantWidget extends StatefulWidget {
  ProductM item;
  GestureTapCallback onTap;

  VariantWidget({required this.item, required this.onTap});

  @override
  State<VariantWidget> createState() => _VariantWidgetState();
}

class _VariantWidgetState extends State<VariantWidget> {
  AddToCartProvider? cartProvider;

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<AddToCartProvider>(context, listen: false);

    return InkWell(
      onTap: openDropDown,
      child: Container(
        width: Get.width / 2,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("${widget.item.shortDescription?.removeTags}")
            Text("${widget.item.getSelectedQuantity.getDisplayString}"),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
    /* return   Expanded(
      child: DropdownSearch<Quantity>(

        popupProps: PopupProps.bottomSheet(
          title: Text("this is title widget"),
          bottomSheetProps: BottomSheetProps(
            // backgroundColor: Colors.red,
            elevation: 15,

          )
        ),

        dropdownDecoratorProps: DropDownDecoratorProps(

        ),

        dropdownButtonProps: DropdownButtonProps(
            // padding: EdgeInsets.zero,

        ),
        items: widget.item.getQuantities,
        // itemAsString: (item) => item.toString() + " " + (item.uom?.shortName??"NoName"),
        */ /*dropdownBuilder: (context,item){
          return ListTile(
            title: Text("${item.toString() + " " + (item?.uom?.shortName??"NoName")}"),
          );
        },*/ /*
        onChanged: (item) {
          setState(() {
            widget.item.selectedQuantity =
                item;
          });
        },
        selectedItem:
        widget.item.getSelectedQuantity,
      ),
    );*/
  }

  void openDropDown() {
    Get.bottomSheet(Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: Colors.white),
      // height: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(20),
                    // border: Border.all(color: Colors.green, width: 2.5),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${AppConst.baseUrl.substring(0, AppConst.baseUrl.length - 1)}${widget.item.mainImage}'),
                        // scale: 1.5,
                        fit: BoxFit.cover),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8,
                          offset: Offset(1, 2))
                    ]),
              ),
              Expanded(
                  child: ListTile(
                title: Text("${widget.item.name}"),
                subtitle: Text("${widget.item.shortDescription?.removeTags}"),
                // subtitle: Text("sdfds".removeTags),
              ))
            ],
          ),
          ListTile(
            title: Text("Choose a Pack Size"),
          ),
          ...widget.item.quantities.map((e) {
            CartM? cartM = cartProvider!.isCartHasThisProduct(e);
            return Card(
              child: ListTile(
                onTap: () {
                  widget.item.selectedQuantity = e;
                  widget.onTap();
                },
                title: Text("${e.getDisplayString}"),
                subtitle: Wrap(
                  spacing: 12,
                  children: [
                    Text(
                      "${e.getDiscountedPrice}",
                      style: productPrice,
                    ),
                    Text("${e.price}", style: productOfferPrice),
                  ],
                ),
                trailing: SizedBox(
                  width: 120,
                  child: CounterWidget(
                      count: cartM?.quantity ?? 0,
                      countChanged: (newCount) {
                        widget.item.selectedQuantity = e;
                        if (newCount == 0) {
                          cartProvider!.deleteCartItem(
                              cartId: cartM?.id.toInt() ?? 0,
                              productId: cartM?.productId ?? 0,
                              sizeId: cartM?.sizeId ?? 0);
                        } else if (newCount == 1) {
                          cartProvider!.postToCart(
                              productId: widget.item.id!.toInt(),
                              quantity: newCount,
                              sizeId: e.id.toInt(),
                              isAdd: true);
                        } else {
                          cartProvider!.editCartItem(cartM: cartM!);
                        }
                        if (mounted) setState(() {});
                      }),
                ),
              ),
            );
          })
        ],
      ),
      // color: Colors.white,
    ));
  }
}
