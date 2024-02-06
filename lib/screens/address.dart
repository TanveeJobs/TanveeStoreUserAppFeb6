import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/changeLocation/changeLocation.dart';
import '../model/location/location.dart';

class ChangeLocation extends StatefulWidget {
  ChangeLocationState createState() => ChangeLocationState();
}

class ChangeLocationState extends State<ChangeLocation> {
  final _controller = TextEditingController();
  List<dynamic> _placesList = [];
  Map<String, dynamic> _placesId = {};
  bool isLoading = true;
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    inputQueryText;
    setPlaceId;
    super.initState();
  }

  void inputQueryText(String value) {
    Provider.of<ChangeLocationProvider>(context, listen: false)
        .findPlaceAutoCompleteSearch(value)
        .then((_) {
      setState(() {
        _placesList =
            Provider.of<ChangeLocationProvider>(context, listen: false).places;
      });
    });
  }

  void setPlaceId(String placeId) async {
    _placesId =
        await Provider.of<ChangeLocationProvider>(context, listen: false)
            .getLatLong(placeId);
    setState(() {
      isLoading = false;
      latitude = _placesId['result']['geometry']['location']['lat'];
      longitude = _placesId['result']['geometry']['location']['lng'];
    });

    print('Latitude $latitude');
    print('Longitude $longitude');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // final provider = Provider.of<ChangeLocationProvider>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80,
        // leading: InkWell(
        //     onTap: () => Navigator.of(context).pop(),
        //     child: const Icon(Icons.arrow_back_ios, color: Colors.red)
        //     ),
        title: Row(
          children: [
            InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back_ios, color: Colors.green)),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: height * 0.006),
                  padding: EdgeInsets.only(left: width * 0.02),
                  // height: double.infinity,
                  height: height * 0.055,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      // color: Colors.transparent,
                      // color: Colors.amber,
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 9,
                          fit: FlexFit.tight,
                          child: Center(
                            child: TextField(
                              controller: _controller,
                              onChanged: (value) {
                                inputQueryText(value);
                              },
                              autofocus: true,
                              cursorColor: Colors.grey,
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 18),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Address',
                                hintStyle: TextStyle(color: Colors.green),
                                // suffixIcon: Icon(
                                //   Icons.send,
                                //   color: Colors.grey,
                                //   size: 20,
                                // )
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: height * 1,
        // color: Colors.red,
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            // onTap: () {
            //   setPlaceId(_placesList[index]['place_id']);
            //   Provider.of<LocationProvider>(context, listen: false)
            //       .setNewAddress(latitude, longitude)
            //       .then((_) {
            //     // Provider.of<LocationProvider>(context, listen: false)
            //     //     .setAddress();
            //     Navigator.of(context).pop();
            //   });
            // },
            child: Container(
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              width: double.infinity,
              height: height * 0.08,
              // color: Colors.amber,
              child: Row(
                children: [
                  const Icon(Icons.place_outlined, color: Colors.red),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: Text(
                      _placesList[index]['description'],
                      // overflow: TextOverflow.visible,
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          itemCount: _placesList.length,
        ),
      ),
    );
  }
}
