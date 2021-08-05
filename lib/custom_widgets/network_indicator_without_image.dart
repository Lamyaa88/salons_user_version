import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/colors.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
class NetworkIndicatorWithoutImage extends StatefulWidget {
  final Widget child;
  const NetworkIndicatorWithoutImage({this.child});
  @override
  _NetworkIndicatorWithoutImageState createState() => _NetworkIndicatorWithoutImageState();
}
class _NetworkIndicatorWithoutImageState extends State<NetworkIndicatorWithoutImage> {
  Widget _buildBodyItem() {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            customDescriptionTextText(
                context: context,
                text: checkDirection(
                    "لا يوجد اتصال بالإنترنت ", "you\'re Offline !" ),textColor: Colors.red , percentageOfHeight: .02)
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        if (connectivity == ConnectivityResult.none) {
          return Scaffold(
            backgroundColor: whiteColor,
            body: _buildBodyItem(),
          );
        } else {
          return child;
        }
      }, builder: (BuildContext context) {return widget.child;},);}}
