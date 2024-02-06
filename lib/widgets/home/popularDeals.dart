import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/app_const.dart';
import '../../model/popularDeals/popularDealsProducts.dart';
import '../../model/categoryProducts/categoryProductsProvider.dart';
import '../../util/AppTextStyle.dart';

class PopularDeals extends StatefulWidget {
  PopularDealsState createState() => PopularDealsState();
}

class PopularDealsState extends State<PopularDeals> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    // Provider.of<PopularDealsProvider>(context, listen: false)
    //     .getPopularDeals()
    //     .then((_) {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
    itemDetail;
    super.initState();
  }

  void itemDetail(int categoryId) async {
    Provider.of<CategoryProductsProvider>(context, listen: false)
        .getCategoryProducts(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<PopularDealsProvider>(context).popularDeals;
    final productsProvider =
        Provider.of<CategoryProductsProvider>(context).categoryProducts;

    // TODO: implement build
    return
        // isLoading
        //     ? const Center(
        //         child: CircularProgressIndicator(
        //           color: Colors.green,
        //         ),
        //       )
        //     :
        Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: width * 0.9,
        height: tabLayout
            ? height * 0.2
            : largeLayout
                ? height * 0.25
                : height * 0.3,
        margin: EdgeInsets.only(bottom: height * 0.04),
        decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
            ]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04, top: height * 0.01, right: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Deals',
                    // // textScaleFactor: textScaleFactor,
                    style: sectionTitle,
                  ),
                  // Text(
                  //   'View All',
                  //   // // textScaleFactor: textScaleFactor,
                  //   style: TextStyle(
                  //       color: Colors.green,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: tabLayout
                  //           ? 18
                  //           : largeLayout
                  //               ? 14
                  //               : 10),
                  // )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: height * 0.1,
                padding: EdgeInsets.fromLTRB(
                    width * 0.02, height * 0.005, width * 0.02, height * 0.008),
                margin: EdgeInsets.only(top: height * 0.01),
                decoration: const BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    dynamic itemMap = provider['data'][index];
                    /*  if(itemMap is Map){
                       itemMap=[itemMap];
                     }*/
                    ProductM item = ProductM.fromJson(itemMap);

                    return Container(
                      width: tabLayout ? width * 0.2 : width * 0.3,
                      height: double.infinity,
                      margin: EdgeInsets.only(right: width * 0.02),
                      padding: const EdgeInsets.all(8.0),

                      // color: Colors.amber,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(1, 2))
                                  ]),
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed('/itemMap-details', arguments: {
                                  'id': itemMap[0]['id'],
                                  'image': itemMap[0]['main_image'],
                                  'name': itemMap[0]['name'],
                                  'quantity': 0,
                                  'description': itemMap[0]['description'],
                                  'price': itemMap[0]['price']
                                }),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    '${AppConst.baseUrl.substring(0, AppConst.baseUrl.length - 1)}${item.mainImage}',
                                    fit: BoxFit.contain,
                                    // width: tabLayout
                                    //     ? width * 0.35
                                    //     : largeLayout
                                    //         ? width * 0.45
                                    //         : width * 0.46,
                                    // height: tabLayout
                                    //     ? height * 0.24
                                    //     : largeLayout
                                    //         ? height * 0.2
                                    //         : height * 0.22,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Padding(
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: RichText(
                                    text: TextSpan(
                                  text: item.name,
                                  style: productText.copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    // TextSpan(
                                    //     // text: " ${item.uom?.size}",
                                    //     // text: ' ₹${item[0]?['price']}/${item[0]?['uom']['short_name']}',
                                    //     style: productText.copyWith(
                                    //         fontWeight: FontWeight.bold))
                                  ],
                                ))),
                          ]),
                    );
                  },
                  itemCount: provider['data']?.length ?? 0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
