import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/address/addressProvider.dart';
import '../model/location/location.dart';
import '../screens/newAddress.dart';

class AddressList extends StatefulWidget {
  AddressListState createState() => AddressListState();
}

class AddressListState extends State<AddressList> {
  bool isLoading = true;
  bool isDefault = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AddressProvider>(context, listen: false)
        .getAddressList()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Future<void> getDefaultAddress() async {
    Provider.of<AddressProvider>(context, listen: false)
        .getAddressList()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<AddressProvider>(context).addressList;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: !tabLayout && !largeLayout ? 80 : 100,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: InkWell(
                    // onTap: () =>
                    //     Navigator.of(context).pushNamed('/landing-page'),
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back_ios,
                        color: Colors.green, size: 35))),
            Center(
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewAddress('', '', '', '', false))),
                child: Container(
                  width: width * 0.8,
                  height: !tabLayout && !largeLayout
                      ? height * 0.075
                      : height * 0.055,
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
                            // spreadRadius: 5,
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
                        'Add New Address',
                        // textScaleFactor: textScaleFactor,
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
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : provider['data'] == null
              ? const Center(
                  child: Text('No Address Selected'),
                )
              : Container(
                  height: height * 1,
                  width: width * 1,
                  // color: Colors.red,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: height * 0.01),
                        // height: height * 0.2,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            Icon(
                                provider['data'][index]['is_default'] == true
                                    ? Icons.check_circle_rounded
                                    : Icons.my_location_rounded,
                                color: Colors.green),
                            Expanded(
                                child: Container(
                              // color: Colors.blue,
                              height: height * 0.118,
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(provider['data'][index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: tabLayout
                                                  ? 25
                                                  : largeLayout
                                                      ? 18
                                                      : 14)),
                                      Container(
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                await Provider.of<
                                                            LocationProvider>(
                                                        context,
                                                        listen: false)
                                                    .selectNewAddress(
                                                        provider['data'][index]
                                                                ['id']
                                                            .toString());
                                                // loadingIndicator();
                                                setState(() {
                                                  isLoading = true;
                                                  // Provider.of<AddressProvider>(
                                                  //         context,
                                                  //         listen: false)
                                                  //     .getAddressList();
                                                  Provider.of<AddressProvider>(
                                                          context,
                                                          listen: false)
                                                      .getDefaultAddress();
                                                  getDefaultAddress();
                                                });
                                                // getDefaultAddress();
                                                // isLoading = false;
                                              },
                                              child: const Text('Select',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(width: width * 0.04),
                                            InkWell(
                                              onTap: () => Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) => NewAddress(
                                                          provider['data']
                                                                  [index]['id']
                                                              .toString(),
                                                          provider['data']
                                                              [index]['name'],
                                                          provider['data']
                                                                  [index][
                                                              'contact_number'],
                                                          '${provider['data'][index]['address_line']}, ${provider['data'][index]['locality']}, ${provider['data'][index]['city']}, ${provider['data'][index]['state']}, ${provider['data'][index]['postcode']}',
                                                          true))),
                                              child: const Text('Edit',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                      provider['data'][index]['contact_number'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 20
                                              : largeLayout
                                                  ? 14
                                                  : 10)),
                                  SizedBox(height: height * 0.005),
                                  Expanded(
                                      child: Text(
                                          '${provider['data'][index]['address_line']}, ${provider['data'][index]['locality']}, ${provider['data'][index]['city']}, ${provider['data'][index]['state']}, ${provider['data'][index]['postcode']}'))
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    itemCount: provider['data'].length,
                  ),
                ),
    );
  }
}
