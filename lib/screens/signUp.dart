import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication/network.dart';
import 'dart:convert';
import '../model/location/location.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final String address;
  final String streetName;
  SignUpState createState() => SignUpState();

  SignUp(this.address, this.streetName);
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? fcm;

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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
    _focusSecond.dispose();
    _focusThird.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final addressProvider =
        Provider.of<LocationProvider>(context, listen: false).deliveryAddress;

    print('Initial Address: $addressProvider');

    // TODO: implement build
    return Scaffold(
      body: Container(
          height: height * 1,
          width: double.infinity,
          // margin: EdgeInsets.only(top: height * 0.08),
          padding: EdgeInsets.only(top: height * 0.01),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 392.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/sign_up_asset.png',
                      width: tabLayout ? double.infinity : null,
                      fit: BoxFit.cover),
                ],
              ),
              Positioned(
                child: Form(
                  key: _globalKey,
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          'Sign Up',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? width * 0.05
                                  : largeLayout
                                      ? 25
                                      : width * 0.06),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? width * 0.03
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              margin: EdgeInsets.only(bottom: height * 0.04),
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
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
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your First Name',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    // textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                                validator: (fName) {
                                  if (fName!.isEmpty) {
                                    return 'Please Enter First Name';
                                  } else if (fName.length < 3) {
                                    return 'First Name must be 3 char long or more';
                                  } else {
                                    firstName = fName;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? width * 0.03
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              margin: EdgeInsets.only(bottom: height * 0.04),
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
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
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your Last Name',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    // textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                                validator: (lName) {
                                  if (lName!.isEmpty) {
                                    return 'Please Enter Last Name';
                                  } else if (lName.length < 3) {
                                    return 'Last Name must be 3 char long or more';
                                  } else {
                                    lastName = lName;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? width * 0.03
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
                              margin: EdgeInsets.only(bottom: height * 0.04),
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
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your Phone Number',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    // textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                                validator: (number) {
                                  if (number!.length < 10 ||
                                      number.length > 10) {
                                    return 'Please Check Your Phone Number';
                                  } else if (number.isEmpty) {
                                    return 'Please Enter Phone Number';
                                  } else {
                                    phoneNumber = '+91' + number;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? width * 0.03
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
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
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your Email',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    // textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                // onFieldSubmitted: (_) => FocusScope.of(context)
                                //     .requestFocus(_focusFirst),
                                validator: (mail) {
                                  if (mail!.isEmpty) {
                                    return 'Please Enter Email';
                                  } else {
                                    email = mail;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? width * 0.03
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                            // SizedBox(width: width * 0.01),
                            SizedBox(height: height * 0.02),
                            Container(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
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
                                initialValue: addressProvider,
                                maxLines: 2,
                                enabled: false,
                                style: TextStyle(
                                    fontSize: tabLayout
                                        ? width * 0.04
                                        : largeLayout
                                            ? 18
                                            : 16),
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    // hintText: 'Enter Your Address',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    // textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                // onFieldSubmitted: (_) => FocusScope.of(context)
                                //     .requestFocus(_focusFirst),
                                // validator: (mail) {
                                //   if (mail!.isEmpty) {
                                //     return 'Please Enter Email';
                                //   } else {
                                //     email = mail;
                                //     return null;
                                //   }
                                // },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: InkWell(
                          // onTap: () =>
                          //     Navigator.of(context).pushNamed('/home-screen'),
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              _signUp(context);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: height * 0.07,
                            margin: EdgeInsets.only(top: height * 0.02),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(57, 226, 14, 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                // // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? width * 0.03
                                        : largeLayout
                                            ? 18
                                            : 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            textAlign: TextAlign.center,
                            // // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout
                                    ? width * 0.03
                                    : largeLayout
                                        ? 14
                                        : 12),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed('/sign-in'),
                            child: Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? width * 0.03
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _signUp(BuildContext context) async {
    var data = {
      'first_name': firstName.toString(),
      'last_name': lastName.toString(),
      'mobile': phoneNumber.toString(),
      'email': email.toString()
    };
    print(data);

    var response = await Provider.of<Network>(context, listen: false)
        .signUp(data, 'api/register/');
    print(response.body);

    var res = json.decode(response.body);

    if (res['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        // duration: const Duration(seconds: 10000),
        content: const Text('An OTP has been sent to your Mobile'),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
      Navigator.of(context).pushNamed('/otp-screen', arguments: {
        'mobile': data['mobile'],
        // 'address': widget.address
        'name': '${data['first_name']} ${data['last_name']}',
        'flag': '1',
        'houseDetails': widget.address,
        'streetName': widget.streetName
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(res['context']['message']),
          backgroundColor: Colors.green,
          action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          )));
    }
  }
}
