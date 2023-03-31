import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlurredAvatar extends StatelessWidget {
  const BlurredAvatar({
    this.fieldKey,
    this.imageUrl,
    this.size,
  });
  final Key fieldKey;
  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        color: Colors.grey,
        image: new DecorationImage(
          image: (imageUrl == null || imageUrl == '')
              ? AssetImage('assets/image/avatar.png')
              : new CachedNetworkImageProvider('https://ozimplatform.kz/' + imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(size / 2)),
        border: new Border.all(
          color: Colors.black,
          width: 0.2,
        ),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
          child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              child: Icon(
                Icons.add_a_photo,
                color: Constants.mainTextColor,
              ))),
    );
  }
}
