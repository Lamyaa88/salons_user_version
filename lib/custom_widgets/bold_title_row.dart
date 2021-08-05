import 'dart:ui';

import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

boldTitleRow({BuildContext context, String text , Function onTapViewMore , bool withViewMore : true
  , Color textColor : textColor , FontWeight fontWeight : FontWeight.normal  , double heightPercentage : .025}) {
  return Container(padding: EdgeInsets.only(right: width(context)*.05 , left: width(context)*.05),
    width: width(context)*.9,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
        translator.translate(text) ,
          style: TextStyle(
            fontWeight: fontWeight,
              color: textColor ,
              fontSize: isLandscape(context)
                  ? 2 * height(context) * heightPercentage
                  : height(context) * heightPercentage),
        ) ,
        withViewMore == true ?
        GestureDetector(onTap: onTapViewMore,child:
          customDescriptionTextText(context:context ,text: translator.translate("View All")
              , fontWeight: FontWeight.bold , textColor: blueColor , percentageOfHeight: .025 ),): SizedBox()
      ],
    ),
  );
}
