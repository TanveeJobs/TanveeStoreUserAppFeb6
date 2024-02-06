import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/home/serch_widget.dart';
import 'package:tanvi/widgets/product_widget.dart';
import '../../model/addToCart/addToCart.dart';
import '../../model/categoryProducts/categoryProductsProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../model/addToCart/addToCart.dart';
import '../bottomNavigation.dart';

class CategoryList extends StatefulWidget {
  final int id;
  final String categoryName;

  CategoryListState createState() => CategoryListState();

  CategoryList(this.id, this.categoryName);
}

class CategoryListState extends State<CategoryList> {
  // int count = 1;
  bool isLoading = true;
  bool isClicked = false;
  String baseUrl = AppConst.baseUrl;

  Map<String, dynamic> cartProvider = Map();

  List<ProductM> providereItemList = [];

  Map<String, dynamic> providerResponseMap = Map();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoryProductsProvider>(context, listen: false)
        .getCategoryProducts(widget.id)
        .then((_) {
      Provider.of<AddToCartProvider>(context, listen: false)
          .getCartProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      }).onError((error, stackTrace) {
        print("Error1 ${error}");
        setState(() {
          isLoading = false;
        });
      });
    }).onError((error, stackTrace) {
      print("stackTrace ${stackTrace}");
      print("Error2 ${error}");
    });

    // categoryCount();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
          toolbarHeight: (tabLayout
                  ? 100
                  : largeLayout
                      ? 55
                      : 60) *
              2,
          centerTitle: true,
          title: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomBottomNavigation())),
                    child: Container(
                      height: tabLayout
                          ? height * 0.07
                          : largeLayout
                              ? height * 0.05
                              : height * 0.08,
                      width: !tabLayout && !largeLayout
                          ? width * 0.12
                          : width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2))
                          ]),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Icon(Icons.arrow_back_ios,
                              size: tabLayout
                                  ? 40
                                  : largeLayout
                                      ? 14
                                      : 18,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: tabLayout
                            ? width * 0.24
                            : largeLayout
                                ? width * 0.16
                                : width * 0.12),
                    child: Text(
                      widget.categoryName,
                      // // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: tabLayout
                              ? 35
                              : largeLayout
                                  ? 18
                                  : 14),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              SerchWidget(catId: widget.id),
            ],
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle 392.png'),
                        fit: BoxFit.cover)),
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      ProductM item = providereItemList[index];
                      return ProductWidget(
                        key: UniqueKey(),
                        item: item,
                        itemMap: providerResponseMap['data'][index],
                        cartItem: cartProvider,
                      );
                    },
                    // separatorBuilder: (context, index) => Divider(
                    //       thickness: 1.0,
                    //       indent: 12,
                    //       endIndent: 12,
                    //       color: Colors.grey[400],
                    //     ),
                    itemCount: providerResponseMap['data']?.length ?? 0),
              ));
  }

  void loadData() {
    cartProvider = Provider.of<AddToCartProvider>(context).cartData;
    var provider = Provider.of<CategoryProductsProvider>(context);
    providerResponseMap = provider.categoryProducts;
    if (providerResponseMap["data"] != null) {
      print("provider is not null");
      // provider["data"][0]=jsonDecode(jsonModel);
      providereItemList = provider.productList;
    } else {
      print("provider is null");
    }
  }
}
