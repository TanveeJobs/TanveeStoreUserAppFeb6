import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/signIn/anotherAddress.dart';
import '../../authentication/network.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import '../../model/location/location.dart';
import '../../screens/address.dart';
import '../../screens/newAddressSelect.dart';
import '../../screens/signUp.dart';
import '../signUp/signUpOtp.dart';
import 'currentLocation.dart';

import 'package:get_storage/get_storage.dart';

class FormWidget extends StatefulWidget {
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _numberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _otpKey = GlobalKey<FormState>();
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  // final _focusFifth = FocusNode();
  String? mobileNumber = '';
  String? firstOtp;
  String? secondOtp;
  String? thirdOtp;
  String? fourthOtp;
  String? fcm;
  // bool isLoading = true;

  Future<void> fcmCodeGenerate() async {
    fcm = await FirebaseMessaging.instance.getToken();
    print('FCM Code $fcm');
  }

  @override
  void initState() {
    // TODO: implement initState
    fcmCodeGenerate();
    super.initState();
  }

  // void getDefault() {
  //   Provider.of<LocationProvider>(context, listen: false)
  //       .getDefaultAddress()
  //       .then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
    _focusSecond.dispose();
    _focusThird.dispose();
    _focusFourth.dispose();
    // _focusFifth.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final addressProvider =
        Provider.of<LocationProvider>(context).deliveryAddress;
    final coOrdinates = Provider.of<LocationProvider>(context).coorDinates;
    // final newAddressProvider =
    //     Provider.of<LocationProvider>(context).newAddressSet;

    // print('New Address: $newAddressProvider');

    // TODO: implement build
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _numberKey,
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.08, right: width * 0.08),
                child: Container(
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.0045),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 10,
                            // color: Color.fromRGBO(227, 189, 255, 0.5),
                            offset: Offset(1, 2))
                      ]),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: tabLayout
                            ? width * 0.04
                            : largeLayout
                                ? 18
                                : 16),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Phone Number',
                        hintStyle: tabLayout
                            ? TextStyle(fontSize: width * 0.04)
                            : TextStyle(fontSize: width * 0.05),
                        suffixIcon: mobileNumber!.length < 10
                            ? null
                            : const Icon(Icons.check_circle,
                                color: Colors.green),
                        // label: Text(
                        //   'Enter Your Phone Number',
                        // textScaleFactor: textScaleFactor,
                        //   style: const TextStyle(color: Colors.grey),
                        // ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_focusFirst),
                    validator: (number) {
                      if (number!.isEmpty) {
                        return 'Please Enter Phone Number';
                      } else if (number.length < 10) {
                        return 'Incorrect Phone Number';
                      } else {
                        mobileNumber = '+91' + number;
                        return null;
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.03),
        // Text(
        //   'Forgot your password?',
        //   textAlign: TextAlign.center,
        //   // // textScaleFactor: textScaleFactor,
        //   style: TextStyle(
        //       color: Colors.grey, fontSize: tabLayout ? width * 0.03 : 14),
        // ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
          child: InkWell(
            onTap: () {
              if (_numberKey.currentState!.validate()) {
                // login(firstOtp!, secondOtp!, thirdOtp!, fourthOtp!,
                //     mobileNumber!, context);
                validateNumber(mobileNumber!, context, addressProvider,
                    coOrdinates, false);
              }
            },
            child: Container(
              width: double.infinity,
              height: height * 0.07,
              // margin: EdgeInsets.only(top: height * 0.02),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(57, 226, 14, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  'Continue',
                  // // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout ? width * 0.04 : 18),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.04),
        TextButton(
            onPressed: () {
              validateNumber(
                  mobileNumber!, context, addressProvider, coOrdinates, true);
            },
            child: Text("Signing Later")),

        SizedBox(height: height * 0.04),
      ],
    );
  }

  void validateNumber(
      String number,
      BuildContext context,
      String addressProvider,
      Map<String, dynamic> coOrdinates,
      bool isSkip) async {
    if (!isSkip) {
      var data = {'mobile': number.toString()};
      var response = await Provider.of<Network>(context, listen: false)
          .logIn(data, 'api/login/');

      print(response.statusCode);

      if (response.statusCode == 204) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    'Enter Delivery Address',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  content: Text(addressProvider == ''
                      ? 'Choose Address'
                      : addressProvider),
                  actions: [
                    TextButton(
                        onPressed: () {
                          choseLocation(coOrdinates, data);
                        },
                        child: const Text(
                          'Choose Current Location',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )),
                    TextButton(
                        onPressed: () =>
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(
                            //         builder: (context) => ChangeNewLocation()))
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AnotherAddress(data['mobile']))),
                        // .then((_) => Navigator.of(context).pop()),
                        child: const Text('Choose Another Address',
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 71, 100)))),
                    // TextButton(
                    //     onPressed: () => Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //             builder: (context) => SignUp(addressProvider))),
                    //     child: const Text(
                    //       'Continue',
                    //       style:
                    //           TextStyle(color: Color.fromARGB(255, 38, 255, 5)),
                    //     ))
                  ],
                ));
      } else if (response.statusCode == 200) {
        var responseCode = json.decode(response.body);
        print(response.body);

        Navigator.of(context).pushNamed('/otp-screen',
            arguments: {'mobile': data['mobile'], 'flag': '0'});

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responseCode['message'],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green,
          action: SnackBarAction(
              label: 'Close',
              textColor: Colors.white,
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar()),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Something Went Wrong',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          action: SnackBarAction(
              label: 'Close',
              textColor: Colors.white,
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar()),
        ));
      }
    } else {
      GetStorage().write(AppConst.keyIsSkippedLogin, true);
      Navigator.pushNamed(context, "/landing-page");
    }
  }

  void login(String firstOtp, String secondOtp, String thirdOtp,
      String fourthOtp, String mobileNumber, BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String otp = firstOtp + secondOtp + thirdOtp + fourthOtp;
    var data = {'otp': otp, 'mobile': mobileNumber};

    var response = await Provider.of<Network>(context, listen: false)
        .loginOtp(data, 'api/login-otp/');

    print(response.body);
    var receivedResponse = json.decode(response.body);

    print('RECEIVED RESPONSE $receivedResponse');

    if (receivedResponse['status'] == true) {
      await localStorage.setString('token', receivedResponse['access']);
      await localStorage.setString('refresh', receivedResponse['refresh']);

      final url = Uri.parse(AppConst.baseUrl + 'api/fcm-token/');

      // var responseFcm =
      //     await Provider.of<Network>(context, listen: false).fcmToken(fcm);

      var responseFcm =
          await http.post(url, body: json.encode({'fcm_token': fcm}), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${localStorage.getString('token')}'
      });

      print('FCM RESPONSE TOKEN: ${responseFcm.body}');

      GetStorage().write(AppConst.keyIsSkippedLogin, false);
      Navigator.of(context).pushNamed('/landing-page');
    } else if (receivedResponse['context']['message'] ==
        'You Enter Wrong OTP') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Incorrect OTP',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'Close',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Please Enter OTP',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'Close',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
  }

  facebookLogin() async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
      }
    } catch (error) {
      print(error);
    }
  }

  googleLogin() async {
    print("googleLogin method Called");
    final _googleSignIn = GoogleSignIn();
    var result = await _googleSignIn.signIn();
    print("Result $result");
  }

  void choseLocation(
      Map<String, dynamic> coOrdinates, Map<String, String> data) {
    Provider.of<LocationProvider>(context, listen: false)
        .setNewAddress(coOrdinates['lat'], coOrdinates['lng'])
        .then((_) {
      Provider.of<LocationProvider>(context, listen: false)
          .newAddress(coOrdinates['lat'], coOrdinates['lng']);
    });
    // Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CurrentLocation(data['mobile'])));
  }
}
