import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/colors.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
class NetworkIndicator extends StatefulWidget {
  final Widget child;
  const NetworkIndicator({this.child});
  @override
  _NetworkIndicatorState createState() => _NetworkIndicatorState();
}
class _NetworkIndicatorState extends State<NetworkIndicator> {
  Widget _buildBodyItem() {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            responsiveSizedBox(context: context, percentageOfHeight: .2),
            Container(
              child: Image.asset(AppImages.no_internet2),
            ),
            responsiveSizedBox(context: context, percentageOfHeight: .02),
            customDescriptionTextText(
                context: context,
                text: checkDirection(
                    "لا يوجد اتصال بالإنترنت ", "you\'re Offline !"))
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
