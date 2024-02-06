import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/categories/categoryList.dart';
import 'package:tanvi/widgets/home/serch_widget.dart';
import '../notificatonService/localNotification.dart';
import '../widgets/home/categories.dart';
import '../widgets/home/discount.dart';
import '../widgets/home/popularDeals.dart';
import '../widgets/home/topSeller.dart';
import '../widgets/home/recentItemsWidget/recentItems.dart';
import '../model/location/location.dart';
import 'package:provider/provider.dart';
import '../screens/wishListScreen.dart';
import '../model/profile/profileProvider.dart';

class HomeScreen extends StatefulWidget {
  ValueChanged<CategoryList> onChanged;

  HomeScreen({required this.onChanged});

  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<LocationProvider>(context).address;
    final profileProvider = Provider.of<ProfileProvider>(context).profile;

    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    print('Height Of Screen: $height');

    // TODO: implement build
    return Container(
      height: height * 1,
      width: width * 1,
      decoration: const BoxDecoration(
          // Commented by Vijay
          // image: DecorationImage(
          //     image: AssetImage('assets/images/Rectangle 392.png'),
          //     fit: BoxFit.cover),
          ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.04, top: height * 0.01, right: width * 0.04),
            child: SerchWidget(),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Categories(onChanged: widget.onChanged),
                ),
                SizedBox(height: height * 0.025),
                Discount(),
                SizedBox(height: height * 0.015),
                PopularDeals(),
                TopSeller(),
                // if (!(GetStorage().read(AppConst.keyIsSkippedLogin) ==
                //     true)) ...[
                //   SizedBox(height: height * 0.001),
                //   WishListScreen(),
                //   SizedBox(height: height * 0.025),
                //   RecentItems(),
                //   SizedBox(height: height * 0.025)
                // ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
