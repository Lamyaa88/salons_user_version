import 'dart:ui';
import 'package:almezyn/utils/file_export.dart';
customBoldText({BuildContext context, String text}) {
  return Text(
    text,
    style: TextStyle(
        color: blackColor,
        fontWeight: FontWeight.bold,
        fontSize: isLandscape(context)
            ? 2 * height(context) * .022
            : height(context) * .022),
  );
}
