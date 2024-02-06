import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/location/location.dart';
import 'newAddressSelect.dart';

class NewAddress extends StatefulWidget {
  final String? id;
  final String? name;
  final String? mobileNumber;
  final String? address;
  final bool? flag;
  NewAddressState createState() => NewAddressState();

  NewAddress(this.id, this.name, this.mobileNumber, this.address, this.flag);
}

class NewAddressState extends State<NewAddress> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? firstName;
  String? phoneNumber;
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final addressController = TextEditingController();
  final streetNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
    _focusSecond.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    dynamic provider = '';
    provider = Provider.of<LocationProvider>(context).newAddressSet;
    final addressProvider =
        Provider.of<LocationProvider>(context).deliveryAddress;
    final coOrdinates = Provider.of<LocationProvider>(context).coorDinates;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: !tabLayout && !largeLayout ? 80 : 100,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: InkWell(
            onTap: () {
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
                                Provider.of<LocationProvider>(context,
                                        listen: false)
                                    .setNewAddress(
                                        coOrdinates['lat'], coOrdinates['lng'])
                                    .then((_) {
                                  Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .newAddress(coOrdinates['lat'],
                                          coOrdinates['lng']);
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Choose Current Location',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )),
                          TextButton(
                              onPressed: () => Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNewLocation()))
                                  .then((_) => Navigator.of(context).pop()),
                              child: const Text('Choose Another Address',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 36, 71, 100)))),
                          // TextButton(
                          //     onPressed: () => Navigator.of(context).push(
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 SignUp(addressProvider))),
                          //     child: const Text(
                          //       'Continue',
                          //       style: TextStyle(
                          //           color: Color.fromARGB(255, 38, 255, 5)),
                          //     ))
                        ],
                      ));
            },
            child: Container(
              width: width * 0.8,
              height:
                  !tabLayout && !largeLayout ? height * 0.075 : height * 0.055,
              margin: EdgeInsets.only(
                top: height * 0.02,
              ),
              padding: EdgeInsets.only(left: width * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.greenAccent,
                        blurRadius: 5,
                        offset: Offset(0, 2))
                  ]),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: !tabLayout && !largeLayout ? 22 : 30,
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    'Enter Address Here',
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: tabLayout
                            ? width * 0.03
                            : largeLayout
                                ? 25
                                : 18),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        child: ListView(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.08, right: width * 0.08),
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.02),
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.0045),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(1, 2))
                          ]),
                      child: TextFormField(
                        initialValue: widget.name,
                        style: TextStyle(
                            fontSize: tabLayout
                                ? width * 0.04
                                : largeLayout
                                    ? 18
                                    : 16),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText:
                                widget.name == '' ? 'Enter Name' : widget.name,
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_focusFirst),
                        validator: (fName) {
                          if (fName!.isEmpty) {
                            return 'Please Enter Name';
                          } else {
                            firstName = fName;
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.08, right: width * 0.08),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.0045),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(1, 2))
                          ]),
                      child: TextFormField(
                        initialValue: widget.mobileNumber,
                        style: TextStyle(
                            fontSize: tabLayout
                                ? width * 0.04
                                : largeLayout
                                    ? 18
                                    : 16),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: widget.mobileNumber == ''
                                ? 'Enter Mobile Number'
                                : widget.mobileNumber,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_focusFirst),
                        validator: (number) {
                          if (number!.isEmpty) {
                            return 'Please Enter Mobile Number';
                          } else {
                            phoneNumber = number;
                            return null;
                          }
                        },
                      ),
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
                    padding: EdgeInsets.only(
                        left: width * 0.08, right: width * 0.08),
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
                  provider.isEmpty
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.08, right: width * 0.08),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('New Address',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout
                                          ? width * 0.03
                                          : largeLayout
                                              ? 14
                                              : 12)),
                              SizedBox(height: height * 0.01),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 10,
                                            offset: Offset(1, 2))
                                      ]),
                                  child:
                                      // Text(provider.isEmpty ? 'No Address Selected' : provider),
                                      Text(provider)),
                            ],
                          )),
                        ),
                  SizedBox(height: height * 0.04),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.08, right: width * 0.08),
                    child: InkWell(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          widget.flag == true
                              ? Provider.of<LocationProvider>(context,
                                      listen: false)
                                  .editAddress(
                                      widget.id,
                                      firstName!,
                                      phoneNumber!,
                                      addressController.text,
                                      streetNameController.text)
                                  .then((_) => Navigator.of(context)
                                      .pushNamed('/address-list'))
                              : Provider.of<LocationProvider>(context,
                                      listen: false)
                                  .setAddress(
                                      firstName!,
                                      phoneNumber!,
                                      addressController.text,
                                      streetNameController.text)
                                  .then((_) => Navigator.of(context)
                                      .pushNamed('/address-list'));
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
                            'Save',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
