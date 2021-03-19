import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final double marginTop;
  final double imageRadius;
  final Color backgroundColor;
  final String path;
  final String placeHolder;
  final bool network;
  final double height;
  final Color imageColor;

  const ImageWidget(
      {Key key,
      this.marginTop = 20.0,
      this.imageRadius = 100,
      this.backgroundColor = Colors.transparent,
      this.path = "assets/images/live_connected_logo.png",
      this.network = false,
      this.height = 300, this.placeHolder = 'assets/images/image_placeholder.png', this.imageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: imageRadius,
        child: network
            ? FadeInImage.assetNetwork(
                placeholder: placeHolder,
                image: path,
                height: height,
                fit: BoxFit.scaleDown,
              )
            : Image.asset(
                path,
                height: height,
                fit: BoxFit.scaleDown,
          color: imageColor ,
              ),
      ),
    );
  }
}
