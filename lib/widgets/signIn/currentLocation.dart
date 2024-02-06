import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/location/location.dart';
import '../../screens/signUp.dart';

class CurrentLocation extends StatefulWidget {
  final String? mobileNumber;

  CurrentLocationState createState() => CurrentLocationState();

  CurrentLocation(this.mobileNumber);
}

class CurrentLocationState extends State<CurrentLocation> {
  final _focusFirst = FocusNode();
  final _focusLast = FocusNode();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String? addressDetails;
  String? streetName;
  final addressController = TextEditingController();
  final streetNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final deliveryAddress =
        Provider.of<LocationProvider>(context).deliveryAddress;

    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.red,
        margin: EdgeInsets.only(top: height * 0.2),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'House No/Block No, Floor No, House/Building Name (Optional)',
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
                  SizedBox(height: height * 0.01),
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
                    child: TextField(
                      style: TextStyle(
                          fontSize: tabLayout
                              ? width * 0.04
                              : largeLayout
                                  ? 18
                                  : 16),
                      controller: addressController,
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                      onChanged: (address) {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Street Name (Optional)',
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
                  SizedBox(height: height * 0.01),
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
                      child: TextField(
                        style: TextStyle(
                            fontSize: tabLayout
                                ? width * 0.04
                                : largeLayout
                                    ? 18
                                    : 16),
                        controller: streetNameController,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        onChanged: (street) {},
                      )),
                ],
              ),
            ),

            //Till Here

            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
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
                      initialValue: deliveryAddress,
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
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: InkWell(
                // onTap: () =>
                //     Navigator.of(context).pushNamed('/home-screen'),
                onTap: () {
                  _signUp(context, addressController.text,
                      streetNameController.text);
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
                      'Continue',
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
            )
          ],
        ),
      ),
    );
  }
}

void _signUp(BuildContext context, String addressDetails, String streetName) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUp(addressDetails, streetName)));
}
