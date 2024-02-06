import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/signIn/sign_in.dart';
import './signUp.dart';

// class SignIn extends StatefulWidget {
//   SignInState createState() => SignInState();
// }

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    print('width of Screen: $width');

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height * 1,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        // margin: EdgeInsets.only(top: height * 0.15),
        padding: EdgeInsets.only(
            top: !tabLayout && !largeLayout ? height * 0.05 : height * 0.11),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome',
                // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width * 0.1),
              ),
            ),
            Center(
              child: Text(
                'Login/Signup to start shopping',
                // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(154, 154, 154, 1),
                    fontSize: width * 0.04),
              ),
            ),
            SizedBox(height: height * 0.04),
            FormWidget(),
            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}
