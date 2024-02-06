import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tanvi/model/location/location.dart';
import 'package:tanvi/model/notificationList/notificationList.dart';
import 'package:tanvi/model/popularDeals/popularDealsProducts.dart';
import 'package:tanvi/screens/my_drawer.dart';
import 'package:tanvi/screens/wallet_screen.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/cart/cart_widget.dart';
import 'package:tanvi/widgets/categories/categoryList.dart';
import 'package:tanvi/widgets/home/serch_widget.dart';
import '../model/category/categoryProvider.dart';
import '../model/coupon/couponProvider.dart';
import '../model/topProducts/topProductsProvider.dart';
import '../model/wishList/wishList.dart';
import '../screens/cartScreen.dart';
import '../screens/dashboard.dart';
import '../screens/homeScreen.dart';
import '../screens/notifications.dart';
import '../screens/profile.dart';
import 'package:provider/provider.dart';
import '../authentication/network.dart';
import '../model/addToCart/addToCart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../model/profile/profileProvider.dart';
import '../model/address/addressProvider.dart';
import '../model/orderHistory/orderHistory.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation>
    with WidgetsBindingObserver {
  int index = 2;
  bool isLoading = true;
  int length = 0;
  var data;

  CategoryList? selecatedCategory;

  @override
  void initState() {
    // TODO: implement initState
    print('Called initState of BottomNavigation - VIJAY');
    Provider.of<Network>(context, listen: false).getToken();
    length = Provider.of<AddToCartProvider>(context, listen: false).length;
    Future.wait([
      Provider.of<CouponProvider>(context, listen: false).fetchCoupons(),
      Provider.of<PopularDealsProvider>(context, listen: false)
          .getPopularDeals(), //commented by vijay
      Provider.of<CategoryProvider>(context, listen: false).getCategory(),
      Provider.of<TopProductsProvider>(context, listen: false)
          .getTopProducts(), //commented by vijay
      if (!(GetStorage().read(AppConst.keyIsSkippedLogin) == true)) ...[
        Provider.of<WishListProvider>(context, listen: false)
            .fetchProducts(), // commented by vijay
        Provider.of<NotificationList>(context, listen: false)
            .getNotificationList(), // commented by vijay
        Provider.of<OrderHistoryProvider>(context, listen: false)
            .getOrderHistory(), // commented by vijay
        Provider.of<AddToCartProvider>(context, listen: false)
            .getCartProducts(), // commented by vijay
        Provider.of<AddressProvider>(context, listen: false)
            .getDefaultAddress(),

        /// commented by vijay
        Provider.of<ProfileProvider>(context, listen: false)
            .getProfileDetails(), // commented by vijay
      ]
    ]).then((value) {
      setState(() {
        isLoading = false;
        length = Provider.of<AddToCartProvider>(context, listen: false)
                .cartData['data']?['cartItem']
                ?.length ??
            0;
      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      length = Provider.of<AddToCartProvider>(context, listen: false)
          .cartData['data']?['cartItem']
          .length;
    });
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final provider = Provider.of<AddToCartProvider>(context).cartData;
    // final profileProvider = Provider.of<ProfileProvider>(context).profile;
    // final cartLength = Provider.of<AddToCartProvider>(context, listen: false).length;
    // final tabLayout = width > 600;
    // final largeLayout = width > 350 && width < 600;
    final defaultAddressProvider =
        Provider.of<AddressProvider>(context).defaultAddress;

    final screens = [
      CartScreen(),
      Dashboard(),
      HomeScreen(onChanged: (categoryList) {
        setState(() {
          selecatedCategory = categoryList;
          index = 5;
        });
      }),
      WalletScreen(),
      Profile(defaultAddressProvider),
      selecatedCategory
    ];
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<LocationProvider>(context).address;
    final profileProvider = Provider.of<ProfileProvider>(context).profile;
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),

      // appBar: AppBar(),
      appBar: index != 5
          ? AppBar(
              backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
              leadingWidth: 12,
              foregroundColor: Colors.black,
              elevation: 0,
              toolbarHeight: 70,
              title: Column(
                children: [
                  Stack(
                    children: [
                      Row(children: [
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              onTap: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              title: Text("Welcome"),
                              subtitle: Text(
                                  '${profileProvider['data'] != null ? profileProvider['data']['first_name'] : "Guest"}'),
                            )),
                        Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text("Current Location",
                                  textAlign: TextAlign.end),
                              subtitle: Text(
                                  provider.isNotEmpty
                                      ? provider
                                      : "Not Selected",
                                  textAlign: TextAlign.end),
                            )),
                      ]),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Image.asset("assets/images/logo-4.png",
                              width: 50),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          : null,
      body: /* isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ):*/
          screens[index],
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = 2;
          });
        },
        backgroundColor: Colors.white,
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        child: index == 2
            ? Icon(Icons.home, color: Colors.blue)
            : Icon(
                Icons.home_outlined,
                color: Colors.black87,
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
          ),
        ),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CartWidget(
                index: index,
                ontap: () {
                  setState(() {
                    index = 0;
                  });
                }),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                icon: index == 1
                    ? Icon(
                        Icons.settings,
                        color: Colors.blue,
                      )
                    : Icon(Icons.settings_outlined)),
            // IconButton(
            //     onPressed: () {
            //       setState(() {
            //         index = 2;
            //       });
            //     },
            //     icon: Icon(
            //       Icons.home_outlined,
            //       color: Colors.transparent,
            //     )),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 3;
                  });
                },
                icon: index == 3
                    ? Icon(
                        Icons.wallet,
                        color: Colors.blue,
                      )
                    : Icon(Icons.wallet_outlined)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 4;
                  });
                },
                icon: index == 4
                    ? Icon(
                        Icons.person,
                        color: Colors.blue,
                      )
                    : Icon(Icons.person_outline)),
          ],
        ),
      ),
    );
  }
}
