import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/cached_image.dart';
import '../../widgets/categories/categoryList.dart';
import '../../model/category/categoryProvider.dart';

class Categories extends StatefulWidget {
  ValueChanged<CategoryList> onChanged;

  Categories({required this.onChanged});

  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider =
        Provider.of<CategoryProvider>(context, listen: false).category;
    // final provider =
    //     Provider.of<CategoryProvider>(context, listen: false).category[0]['data'];

    print('VIJAY CATEGORY PROVIDER ${provider}');

    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        // width: width * 0.9,
        // height: (!tabLayout && !largeLayout ? height * 0.28 : height * 0.25)*2.6,
        decoration: BoxDecoration(
            color: Colors.white,
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
                    'Categories',
                    style: sectionTitle,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed('/category-screen'),
                    child: Text(
                      'View All',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: tabLayout
                              ? 18
                              : largeLayout
                                  ? 14
                                  : 10),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              // height: height * 0.3,
              margin: EdgeInsets.only(top: height * 0.01),
              padding: EdgeInsets.only(
                  left: width * 0.02,
                  top: height * 0.005,
                  right: width * 0.02,
                  bottom: height * 0.008),
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: provider.length > AppConst.homescreenCategoryCount
                    ? AppConst.homescreenCategoryCount
                    : provider.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .75, crossAxisCount: 3),
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(4),
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.004),
                        child: InkWell(
                          // onTap: () {
                          //   widget.onChanged(
                          //     CategoryList(
                          //       provider[index]['id'],
                          //       provider[index]['name'],
                          //     ),
                          //   );
                          // },
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CategoryList(
                                provider[index]['id'], provider[index]['name']),
                          )),
                          child: Container(
                            width: double.infinity,
                            // height: double.infinity,
                            height: tabLayout
                                ? height * 0.14
                                : largeLayout
                                    ? height * 0.12
                                    : height * 0.15,
                            padding: EdgeInsets.all(height * 0.015),
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(2, 1))
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:
                                  CachedImage(provider[index]['categoryImage']),
                              /* child: Image.network(
                                provider[index]['categoryImage'],
                                fit: BoxFit.cover,
                              ),*/
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        provider[index]['name'],
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13.5),
                      )
                    ],
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
