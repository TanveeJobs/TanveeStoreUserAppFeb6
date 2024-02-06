import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import '../model/wishList/wishList.dart';

class WishListScreen extends StatefulWidget {
  WishListScreenState createState() => WishListScreenState();
}

class WishListScreenState extends State<WishListScreen> {
  // bool isLoading = true;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<WishListProvider>(context, listen: false)
  //       .fetchProducts()
  //       .then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<WishListProvider>(context).wishList;
    List<ProductM> providereItemList = [];
    if (provider["data"] != null)
      providereItemList = List<ProductM>.from(
          provider["data"].map((x) => ProductM.fromJson(x)));
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: width * 0.9,
        height: height * 0.33,
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
                    'Wishlist',
                    style: sectionTitle,
                  ),
                ],
              ),
            ),
            provider['data'].length == 0
                ? const Center(
                    child: Text('No Items In Wishlist'),
                  )
                : Expanded(
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
                        itemBuilder: (context, index) {
                          var item=providereItemList[index];
                          return InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed('item-details-two', arguments: {
                            'id': provider['data'][index]['ProductId'],
                            'wishListId': provider['data'][index]['id'],
                            'name': provider['data'][index]['ProductName'],
                            'image': provider['data'][index]['mainImage'],
                            'description': provider['data'][index]
                                ['ShortDescription'],
                            'price': provider['data'][index]['price'],
                            'quantity': 0
                          }),
                          child: Container(
                            width: tabLayout
                                ? width * 0.25
                                : largeLayout
                                    ? width * 0.45
                                    : width * 0.4,
                            height: double.infinity,
                            margin: EdgeInsets.only(right: width * 0.02),
                            // color: Colors.amber,
                            child: Stack(
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          provider['data'][index]['mainImage'],
                                          fit: BoxFit.cover,
                                          width: width * 0.45,
                                          height: height * 0.2,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.005),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.03),
                                        child: Text(
                                          provider['data'][index]
                                              ['ProductName'],
                                          // textScaleFactor: textScaleFactor,
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
                                      if(item.discountPercentage > 0)
                                        ...[
                                          AutoSizeText(
                                            '₹${item.getDiscountedPrice}',
                                            style: productPrice,
                                          ),
                                        ],
                                      Text(
                                        '₹${provider['data']['cartItem'][index]['price']}',
                                        style: item
                                            .discountPercentage ==
                                            0?productPrice: productOfferPrice,
                                      ),
                                    ]),
                                Positioned(
                                  left: tabLayout ? width * 0.22 : width * 0.39,
                                  child: InkWell(
                                    onTap: () {
                                      Provider.of<WishListProvider>(context,
                                              listen: false)
                                          .deleteItem(
                                              provider['data'][index]['id']);
                                      setState(() {
                                        provider['data'].removeAt(index);
                                      });
                                    },
                                    // deleteItem(
                                    //     provider['data'][index]['id']),
                                    child: const Icon(Icons.delete,
                                        color:
                                            Color.fromARGB(255, 153, 31, 23)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        },
                        itemCount: provider['data'].length,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void deleteItem(int wishListId) async {
    final response = await Provider.of<WishListProvider>(context, listen: false)
        .deleteItem(wishListId);
  }
}
