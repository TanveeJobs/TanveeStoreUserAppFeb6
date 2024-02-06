import 'package:flutter/material.dart';
import 'package:tanvi/util/AppTextStyle.dart';

class SerchWidget extends StatelessWidget {
  int? catId;
  SerchWidget({this.catId});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed('/search-screen',arguments: catId),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
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
                Icons.search_outlined,
                color: Colors.grey,

              ),
              SizedBox(width: 8),
              Text(
                'Search',
                style:searchBox ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
