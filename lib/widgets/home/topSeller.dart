import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/widgets/topseller/top_seller_list.dart';
import '../../model/topProducts/topProductsProvider.dart';

class TopSeller extends StatefulWidget {
  TopSellerState createState() => TopSellerState();
}

class TopSellerState extends State<TopSeller> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final firstProvider =
        Provider.of<TopProductsProvider>(context).topProductsFirst;
    final firstProviderModel =
        firstProvider.map((e) => ProductM.fromJson(e)).toList();
    final secondProvider =
        Provider.of<TopProductsProvider>(context).topProductsSecond;
    final secondProviderModel =
        secondProvider.map((e) => ProductM.fromJson(e)).toList();

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fresh Arrivals',
            style: sectionTitle,
            // // textScaleFactor: textScaleFactor,
            /*  style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: tabLayout
                    ? 25
                    : largeLayout
                        ? 17
                        : 12),*/
          ),
          SizedBox(height: height * 0.01),
          TopSellerList(firstProvider),
          // SizedBox(height: height * 0.01),
          TopSellerList(secondProvider),
          Container(
            width: width * 0.9,
            height: tabLayout
                ? height * 0.35
                : largeLayout
                    ? height * 0.3
                    : height * 0.32,
            // color: Colors.red,
            margin: EdgeInsets.only(bottom: height * 0.04),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: height * 0.1,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.005,
                        width * 0.02, height * 0.008),
                    margin: EdgeInsets.only(top: height * 0.01),
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: width * 0.45,
                        height: double.infinity,
                        margin: EdgeInsets.only(right: width * 0.02),
                        // color: Colors.amber,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed('/item-details', arguments: {
                                  'id': secondProvider[index]['id'],
                                  'image': secondProvider[index]['main_image'],
                                  'name': secondProvider[index]['name'],
                                  'quantity': 0,
                                  'description': secondProvider[index]
                                      ['description'],
                                  'price': secondProvider[index]['price']
                                }),
                                child: Container(
                                  width: width * 0.45,
                                  height: tabLayout
                                      ? height * 0.27
                                      : largeLayout
                                          ? height * 0.2
                                          : height * 0.22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                            offset: Offset(1, 2))
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      'AppConst.baseUrl${secondProvider[index]['main_image']}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: Text(
                                  secondProvider[index]['name'],
                                  // // textScaleFactor: textScaleFactor,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout
                                          ? width * 0.02
                                          : largeLayout
                                              ? 14
                                              : 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: Text(
                                    '₹${secondProvider[index]['price']}/${secondProvider[index]['weight']}${secondProvider[index]['uom']['short_name']}',
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? width * 0.02
                                            : largeLayout
                                                ? 14
                                                : 12)),
                              ),
                            ]),
                      ),
                      itemCount: secondProvider.length,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
