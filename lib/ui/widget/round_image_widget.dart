import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class RoundImageWidget extends StatelessWidget {
  final double marginTop;
  final double imageRadius;
  final Color backgroundColor;
  final String path;
  final String placeHolder;
  final bool network;
  final double height;
  final bool plusButton;
  final Color placeHolderColor;

  const RoundImageWidget(
      {Key key,
      this.marginTop = 20.0,
      this.imageRadius = 100,
      this.backgroundColor = Colors.transparent,
      this.path = "assets/images/ilocum_logo.png",
      this.network = false,
      this.height = 300, this.placeHolder = 'assets/images/image_placeholder.png', this.plusButton = true, this.placeHolderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: imageRadius,
        backgroundImage: network && path.isNotEmpty
            ? FadeInImage.assetNetwork(
          placeholder: placeHolder,
          image: path,
          height: height,
          fit: BoxFit.scaleDown,
        ).image
            : Image.asset(
          path.isNotEmpty ? path : placeHolder,
          height: height,
          fit: BoxFit.scaleDown,
          color: placeHolderColor,
        ).image,
        child: path.isEmpty ? Stack(
          children: [
            /*Image.asset(
              placeHolder,
              height: 10,
              fit: BoxFit.scaleDown,
              color: placeHolderColor,
            ),*/
            plusButton ? Container(
              padding: EdgeInsets.all(4),
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/add.png",
                height: 24,
                fit: BoxFit.scaleDown,
                color: primaryColorDark,
              ),
            ) : Container()
          ],
        ) : Text(""),
      ),
    );
  }
}
