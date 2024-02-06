import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  String url;
  CachedImage(this.url);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.blue,
        highlightColor: Colors.black,
        child: CupertinoActivityIndicator(),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.fill,
    );
  }
}
