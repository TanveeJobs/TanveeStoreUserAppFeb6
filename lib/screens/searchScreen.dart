import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/app_const.dart';
import '../model/products/productsProvider.dart';

class Search extends StatefulWidget {
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  final _controller = TextEditingController();
  bool switchState = true;
  bool isLoading = false;
  List<dynamic> query = [];
  List<dynamic> data = [];
  List<dynamic> queryRestaurant = [];
  List<dynamic> restauranData = [];

  ProductsProvider? prodductProvider;

  int? categoryid;

  /* searchByQuery(String search) {
    setState(() {
      query = data
          .where((element) =>
              element['name'].toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }*/

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    prodductProvider = Provider.of<ProductsProvider>(context, listen: true);
    categoryid = ModalRoute.of(context)!.settings.arguments as int?;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // backgroundColor: Colors.green,
        titleSpacing: 0,
        toolbarHeight: !tabLayout && !largeLayout ? 80 : 100,
        title: Container(
          height: 70,
          width: double.infinity,
          // color: Colors.red,
          child: Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, top: height * 0.014),
                child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back_ios,
                        color: Colors.green, size: 30)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    right: width * 0.04,
                    bottom: height * 0.01),
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
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.grey,
                          size: !tabLayout && !largeLayout ? 22 : 28,
                        ),
                      ),
                      Flexible(
                        flex: 9,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 0.025),
                          child: TextField(
                            controller: _controller,
                            onChanged: (value) => prodductProvider!
                                .getProductsByKeyWord(
                                    query: value,
                                    params: categoryid == null
                                        ? ""
                                        : "&category=$categoryid"),
                            autofocus: true,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: !tabLayout && !largeLayout ? 14 : 20),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Products',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 392.png'),
                      fit: BoxFit.cover)),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // color: Colors.red,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      var item = prodductProvider!.searchProducts[index];
                      ProductM productM = ProductM.fromJson(item);
                      // return Text("${productM.toJson()}");

                      return InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/item-details', arguments: {
                          'id': item['id'],
                          'image': item['main_image'],
                          'name': item['name'],
                          'description': item['description'],
                          'price': item['price'],
                          'quantity': 0,
                          'itemModel': productM
                        }),
                        child: Container(
                          width: double.infinity,
                          height: tabLayout
                              ? height * 0.2
                              : largeLayout
                                  ? height * 0.2
                                  : height * 0.2,
                          margin: EdgeInsets.only(bottom: height * 0.01),
                          padding: const EdgeInsets.all(10),
                          // color: Colors.green,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: tabLayout
                                    ? width * 0.31
                                    : largeLayout
                                        ? width * 0.26
                                        : width * 0.18,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: Image.network(
                                  '${AppConst.baseUrl.substring(0, AppConst.baseUrl.length - 1)}${item['main_image']}',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: double.infinity,
                                padding: EdgeInsets.only(left: width * 0.025),
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 22
                                              : largeLayout
                                                  ? 18
                                                  : 14),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                        'Category: ${item['category']['name']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 18
                                                : largeLayout
                                                    ? 16
                                                    : 12)),
                                    SizedBox(height: height * 0.01),
                                    // '₹${item.offer_price}',
                                    Text(
                                        'Price: ₹${productM.quantities.first.price}/${productM.quantities.first.weight}${productM.quantities.first.uom?.shortName}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 18
                                                : largeLayout
                                                    ? 16
                                                    : 12)),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: prodductProvider!.searchProducts.length),
              )),
    );
  }
}
