import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication/network.dart';
import '../widgets/signUp/signUpOtp.dart';

class OtpScreen extends StatefulWidget {
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        // color: Colors.red
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'An OTP has been sent to your Mobile',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: tabLayout
                      ? width * 0.03
                      : largeLayout
                          ? 20
                          : 16),
            ),
            Text(
              'Please Enter to Continue',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: tabLayout
                      ? width * 0.03
                      : largeLayout
                          ? 20
                          : 16),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: SizedBox(
                height: height * 0.25,
                width: double.infinity,
                // color: Colors.red,
                child: InputOTP(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
