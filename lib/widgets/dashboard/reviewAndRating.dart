import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/util/app_const.dart';
import '../../model/rating/ratingProvider.dart';

class ReviewAndRating extends StatefulWidget {
  ReviewAndRatingState createState() => ReviewAndRatingState();
}

class ReviewAndRatingState extends State<ReviewAndRating> {
  double rating = 0;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<RatingProvider>(context, listen: false).getRatings().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  // final List<dynamic> _review = [
  //   {
  //     'name': 'Super Market',
  //     'description': 'Lorem Ipsum dolor sit amet',
  //     'totalRatings': 14,
  //     'image': 'assets/images/0lfc89xj.png'
  //   },
  //   {
  //     'name': 'Super Market',
  //     'description': 'Lorem Ipsum dolor sit amet',
  //     'totalRatings': 14,
  //     'image': 'assets/images/6fge7386.png'
  //   },
  //   {
  //     'name': 'Super Market',
  //     'description': 'Lorem Ipsum dolor sit amet',
  //     'totalRatings': 14,
  //     'image': 'assets/images/qk855erb.png'
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<RatingProvider>(context).ratings;

    // TODO: implement build
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: Colors.green),
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(
                left: width * 0.02, top: height * 0.005, right: width * 0.02),
            decoration: BoxDecoration(
                // color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage('assets/images/Rectangle 392.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Ratings',
                  // // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 25
                          : largeLayout
                              ? 18
                              : 12),
                ),
                SizedBox(height: height * 0.005),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // color: Colors.amber,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: tabLayout
                            ? height * 0.1
                            : largeLayout
                                ? height * 0.08
                                : height * 0.1,
                        margin: EdgeInsets.only(bottom: height * 0.01),
                        padding: EdgeInsets.only(
                            left: width * 0.01, right: width * 0.01),
                        // color: Colors.blue,
                        child: Row(
                          children: [
                            Image.network(
                              '${AppConst.baseUrl}${provider['data'][index]['product']['main_image']}',
                              // fit: BoxFit.cover,
                              scale: 0.6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  provider['data'][index]['product']['name'],
                                  // // textScaleFactor: textScaleFactor,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout ? 22 : 14),
                                ),
                                // Text(
                                //   _review[index]['description'],
                                //   // // textScaleFactor: textScaleFactor,
                                //   style: TextStyle(
                                //       color: Colors.grey,
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: tabLayout ? 20 : 14),
                                // ),
                                SizedBox(height: height * 0.005),
                                Row(
                                  children: [
                                    Text(
                                      'Rating:',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout ? 20 : 12),
                                    ),
                                    SizedBox(width: width * 0.01),
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    Text(
                                      '(${provider['data'][index]['rating']})',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout ? 15 : 12),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      itemCount: provider['data'].length < 3
                          ? provider['data'].length
                          : 3,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
