import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';
import '../../model/coupon/couponProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Discount extends StatefulWidget {
  DiscountState createState() => DiscountState();
}

class DiscountState extends State<Discount> {
  bool isLoading = true;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<CouponProvider>(context, listen: false)
  //       .fetchCoupons()
  //       .then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<CouponProvider>(context).coupon;

    // TODO: implement build
    return
        // isLoading
        //     ? const Center(
        //         child: CircularProgressIndicator(
        //           color: Colors.green,
        //         ),
        //       )
        //     :
        (provider['data']?.length ?? 0) == 0
            // : provider['data'] == []
            ? const Center(
                child: Text('No Offers Available'),
              )
            : Padding(
                padding:
                    EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: width * 0.03),
                      child: Text(
                        'OFFERS',
                        textAlign: TextAlign.left,
                        style: sectionTitle.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                    ),
                    Container(
                        width: width * 0.95,
                        height: tabLayout
                            ? height * 0.24
                            : largeLayout
                                ? height * 0.20
                                : height * 0.22,
                        padding: EdgeInsets.only(
                          left: width * 0.035,
                          top: height * 0.01,
                          right: width * 0.035,
                          // bottom: height * 0.01
                        ),
                        // color: Colors.red,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Stack(
                            children: [
                              InkWell(
                                onTap: () => showAlertDialog(
                                    context,
                                    provider['data'][index]['offer_short_desc'],
                                    provider['data'][index]['id'].toString(),
                                    provider['data'][index]['offer_code']),
                                child: Container(
                                  margin: EdgeInsets.only(right: width * 0.02),
                                  width: width * 0.65,
                                  height: tabLayout
                                      ? height * 0.2
                                      : largeLayout
                                          ? height * 0.16
                                          : height * 0.24,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent[100],
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                            offset: Offset(0, 2))
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      '${AppConst.baseUrl.substring(0, AppConst.baseUrl.length - 1)}${provider['data'][index]['offer_banner']}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: height * 0.105,
                                child: InkWell(
                                  onTap: () => showAlertDialog(
                                      context,
                                      provider['data'][index]
                                          ['offer_full_desc'],
                                      provider['data'][index]['id'].toString(),
                                      provider['data'][index]['offer_code']),
                                  child: Center(
                                    child: Text(
                                      provider['data'][index]['offer_code'],
                                      style: bannerText,
                                      /*  style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? width * 0.04
                                              : largeLayout
                                                  ? 25
                                                  : 18),*/
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: height * 0.125,
                                child: InkWell(
                                  onTap: () => showAlertDialog(
                                      context,
                                      provider['data'][index]
                                          ['offer_full_desc'],
                                      provider['data'][index]['id'].toString(),
                                      provider['data'][index]['offer_code']),
                                  child: Center(
                                    child: Text(
                                      '${provider['data'][index]['discount']}% OFF',
                                      style: bannerText.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700),
                                      /* style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? width * 0.04
                                              : largeLayout
                                                  ? 24
                                                  : 18),*/
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          itemCount: provider['data'].length,
                        )),
                  ],
                ),
              );
  }

  void showAlertDialog(
      BuildContext context, String description, String id, String code) {
    print('Dialog Clicked');
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Offer Applicable'),
              content: Text(description, textAlign: TextAlign.center),
              actions: [
                TextButton(
                    onPressed: () async {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      var res = await Provider.of<CouponProvider>(context,
                              listen: false)
                          .applyCoupon(code);
                      if (res['message'] != 'This Coupon is expired') {
                        Provider.of<CouponProvider>(context, listen: false)
                            .getCouponDetails(id);
                        localStorage.setString('coupon', code).then((_) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('$code Selected',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              action: SnackBarAction(
                                  label: 'OK',
                                  textColor: Colors.white,
                                  onPressed: () =>
                                      Navigator.of(context).pop())));
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(res['message']),
                            action: SnackBarAction(
                                label: 'OK',
                                textColor: Colors.white,
                                onPressed: () => Navigator.of(context).pop())));
                      }
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ));
  }
}
