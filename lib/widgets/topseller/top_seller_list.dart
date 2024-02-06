import 'package:flutter/material.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';

class TopSellerList extends StatelessWidget {
List<dynamic> productList;

  List<ProductM> productListModel=[];


TopSellerList(this.productList){
  productListModel =productList.map((e) => ProductM.fromJson(e)).toList();
}

@override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    return Container(
      width: width * 0.9,
      height: (tabLayout ? height * 0.35 : largeLayout ? height * 0.3 : height * 0.32)*.9,
      // color: Colors.red,
      // margin: EdgeInsets.only(bottom: height * 0.04),
      child: Container(
        width: double.infinity,
        // height: height * 0.1,
        // padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.005, width * 0.02, height * 0.008),
        // margin: EdgeInsets.only(top: height * 0.01),
        decoration: const BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = productListModel[index];
            return Container(
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
                        'id': productList[index]['id'],
                        'image': productList[index]['main_image'],
                        'name': productList[index]['name'],
                        'quantity': 0,
                        'description': productList[index]
                        ['description'],
                        'price': productList[index]['price']
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
                            '${AppConst.baseUrl}${productList[index]['main_image']}',
                            // scale: 0.6,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                        padding:
                        EdgeInsets.only(left: width * 0.03),
                        child: RichText(
                            text: TextSpan(
                              text: productList[index]['name'],
                              style: productText,
                              children: [
                                TextSpan(
                                    text:" ${item.uom?.shortName}",
                                    // ' ₹${productList[index]['price']}/${productList[index]['weight']}${productList[index]['uom']['short_name']}',
                                    style: productText.copyWith(
                                        fontWeight: FontWeight.bold))
                              ],
                            ))
                      /*     child: Text(
                              firstProvider[index]['name'],
                              // // textScaleFactor: textScaleFactor,
                              style: ,
                             style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? width * 0.02
                                      : largeLayout
                                      ? 14
                                      : 12),
                            ),*/
                    ),
                    /* Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: Text(
                                '₹${firstProvider[index]['price']}/${firstProvider[index]['weight']}${firstProvider[index]['uom']['short_name']}',
                                // // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? width * 0.02
                                        : largeLayout
                                        ? 14
                                        : 12)),
                          ),*/
                  ]),
            );
          },
          itemCount: productList.length,
        ),
      ),
    );
  }
}
