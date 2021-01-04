import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

class CircleAvatarImg extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  final double size;
  final bool hasBorder;

  CircleAvatarImg({this.imgUrl, this.isActive = false, this.size,this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Palette.facebookBlue,
          radius: size,
          child: CircleAvatar(
              radius: hasBorder ? size -2.0 :size,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundImage: CachedNetworkImageProvider(imgUrl)),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.online,
                        border: Border.all(width: 2.0, color: Colors.white))))
            : const SizedBox.shrink()
      ],
    );
  }
}
