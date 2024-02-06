import 'package:flutter/material.dart';
import 'package:tanvi/model/address/addressProvider.dart';
import 'package:tanvi/model/orderHistory/orderHistory.dart';
import 'package:tanvi/util/app_const.dart';
import '../widgets/dashboard/graph.dart';
import '../widgets/dashboard/orderHistory.dart';
import '../widgets/dashboard/paymentMethod.dart';
import '../widgets/dashboard/frequent.dart';
import '../widgets/dashboard/referFriend.dart';
import '../widgets/dashboard/notification.dart';
import '../widgets/dashboard/reviewAndRating.dart';
import '../widgets/bottomNavigation.dart';
import 'package:provider/provider.dart';
import '../model/profile/profileProvider.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<ProfileProvider>(context).profile;
    final defaultAddress = Provider.of<AddressProvider>(context).defaultAddress;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    print('Dashboard' + provider['data'].toString());

    // TODO: implement build
    return Container(
      height: height * 1,
      width: width * 1,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover)),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            child: Row(
              children: [
                Container(
                  width: width * 0.32,
                  height: tabLayout ? height * 0.18 : height * 0.15,
                  padding: EdgeInsets.only(
                      top: height * 0.002,
                      right: width * 0.005,
                      bottom: height * 0.002),
                  decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green,
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Container(
                    width: width * 0.3,
                    height: 0.15,
                    padding: EdgeInsets.only(
                        left: width * 0.06,
                        top: height * 0.001,
                        bottom: height * 0.001),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(236, 236, 248, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: provider['data']['profile_pic'] == null
                        ? const Center(
                            child: Text('No Image Selected'),
                          )
                        : Image.network(
                            '${AppConst.baseUrl}${provider['data']['profile_pic']}',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: height * 0.15,
                  // color: Colors.red,
                  padding:
                      EdgeInsets.only(left: width * 0.04, top: height * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${provider['data']['first_name']} ${provider['data']['last_name']}',
                            // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout
                                    ? 45
                                    : largeLayout
                                        ? 20
                                        : 14),
                          ),
                          Icon(Icons.edit,
                              color: Colors.black,
                              size: tabLayout
                                  ? 35
                                  : largeLayout
                                      ? 20
                                      : 14)
                        ],
                      ),
                      Text(
                        provider['data']['email'],
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: tabLayout
                                ? 22
                                : largeLayout
                                    ? 14
                                    : 12),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: Container(
                  padding: EdgeInsets.only(
                      left: width * 0.02,
                      top: height * 0.01,
                      right: width * 0.02,
                      bottom: height * 0.01),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.green,
                            blurRadius: 10,
                            offset: Offset(0, 2))
                      ]),
                  child: Row(
                    children: [
                      Icon(Icons.location_pin,
                          color: Colors.green,
                          size: !tabLayout && !largeLayout ? 18 : 30),
                      Expanded(
                        child: Text(
                          defaultAddress,
                          // defaultAddress!,
                          // 'Default Address',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: tabLayout
                                  ? 20
                                  : largeLayout
                                      ? 15
                                      : 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
          SizedBox(height: height * 0.01),
          SizedBox(height: height * 0.02),
          Container(
            height: tabLayout
                ? height * 0.5
                : largeLayout
                    ? height * 0.4
                    : height * 0.55,
            width: width * 0.6,
            padding: EdgeInsets.only(
                left: width * 0.02,
                top: height * 0.02,
                right: width * 0.02,
                bottom: height * 0.02),
            // color: Colors.red,
            child: OrderHistory(),
          ),
          SizedBox(height: height * 0.02),
          //To Be Done Later
          // Container(
          //   width: double.infinity,
          //   height: tabLayout
          //       ? height * 0.29
          //       : largeLayout
          //           ? height * 0.25
          //           : height * 0.28,
          //   padding: EdgeInsets.only(
          //       left: width * 0.02,
          //       top: height * 0.01,
          //       right: width * 0.02,
          //       bottom: height * 0.01),
          //   // color: Colors.red,
          //   child: Frequent(),
          // ),
          // SizedBox(height: height * 0.02),
          Container(
            height: !tabLayout && !largeLayout ? height * 0.32 : height * 0.28,
            // color: Colors.blue,
            padding: EdgeInsets.only(
                left: width * 0.02,
                top: height * 0.01,
                right: width * 0.02,
                bottom: height * 0.01),
            child: DashboardNotification(),
          ),
          SizedBox(height: height * 0.02),
          Container(
            width: width * 1,
            height: tabLayout
                ? height * 0.35
                : largeLayout
                    ? height * 0.33
                    : height * 0.38,
            // color: Colors.red,
            padding: EdgeInsets.only(
                left: width * 0.02,
                top: height * 0.01,
                right: width * 0.02,
                bottom: height * 0.01),
            child: ReviewAndRating(),
          ),
          SizedBox(height: height * 0.06)
        ],
      ),
    );
  }
}
