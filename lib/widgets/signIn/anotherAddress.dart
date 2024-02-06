import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/location/location.dart';
import '../../screens/newAddressSelect.dart';
import '../../screens/signUp.dart';

class AnotherAddress extends StatefulWidget {
  final String? mobileNumber;

  AnotherAddressState createState() => AnotherAddressState();

  AnotherAddress(this.mobileNumber);
}

class AnotherAddressState extends State<AnotherAddress> {
  final _focusFirst = FocusNode();
  final _focusLast = FocusNode();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String addressDetails = '';
  String streetName = '';
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
    final newAdressSet = Provider.of<LocationProvider>(context).newAddressSet;

    print('SELECT ANOTHER ADDRESS PAGEEEEE');

    print('NEWWWWWWWWWWWW ADRESSSSSSSSSS: $newAdressSet');

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
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeNewLocation())),
                    child: Text(
                      'Click Here To Select Address',
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
                  // SizedBox(width: width * 0.01),
                  SizedBox(height: height * 0.02),
                  Text(
                      newAdressSet == '' ? 'No Address Selected' : newAdressSet)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: InkWell(
                onTap: () {
                  _signUp(context, addressController.text,
                      streetNameController.text, newAdressSet);
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

void _signUp(BuildContext context, String addressDetails, String streetName,
    String newAdressSet) {
  print('addressDetails : $addressDetails');
  print('streetName : $streetName');

  if (newAdressSet == '') {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('No Address Selected'),
              content: Text('You must select an address to proceed'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ))
              ],
            ));
  } else {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SignUp(addressDetails, streetName)));
  }
}
