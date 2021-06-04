import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../../main.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onModelReady;
  final Function() onDestroy;
  final bool lockScreen;

  BaseView({@required this.builder, this.onModelReady, this.onDestroy, this.lockScreen = true});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model = locator<T>();
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDestroy != null) {
      widget.onDestroy();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Future.delayed(const Duration(seconds: 1)).then((value) {
      checkScreenSize(screenWidth);
    });

    return ChangeNotifierProvider<T>.value(
      value: model,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              width: UIHelper.isLargeScreen(screenWidth)
                  ? screenWidth
                  : widget.lockScreen
                  ? 1100
                  : screenWidth,
              child: Consumer<T>(builder: widget.builder))),
    );
  }

  void checkScreenSize(double screenWidth) {
    if (!UIHelper.isLargeScreen(screenWidth) &&
        showMyDialog &&
        widget.lockScreen) {
      UIHelper.showDialogOneAction(context, "Best Experience",
          Text("Please use a bigger screen for the best view of the site."),
              () {
            setState(() {
              showMyDialog = false;
            });
          }, "OK");
      setState(() {
        showMyDialog = false;
      });
    }
  }
}
