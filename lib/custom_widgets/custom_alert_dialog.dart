import 'package:flutter/cupertino.dart';
import 'package:almezyn/custom_widgets/custom_description_text.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Future showCustomAlertDialog(

    {BuildContext context,
      bool withSecondTitle : false ,
      String secondTitle : "" ,
      Widget icon : const Icon(Icons.close),
    Color circleColor: blueColor,
    String alertTitle: '',
    String alertSubtitle: '',
    bool withTwoButtons: false,
      int  maxLines : 2 ,
    String secondButtoText : "" ,
    Function onTapSecondButton}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: isLandscape(context)
              ? .7 * width(context) * .85
              : width(context) * .85,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              responsiveSizedBox(context: context, percentageOfHeight: .02),
//              Container(
//                  height: isLandscape(context)
//                      ? 2 * height(context) * .1
//                      : height(context) * .1,
//                  decoration:
//                      BoxDecoration(shape: BoxShape.circle, color: circleColor ),
//                  child: Center(child: icon)),
              responsiveSizedBox(context: context, percentageOfHeight: .02),
             customBoldText(context: context, text: alertTitle),
             responsiveSizedBox(context: context, percentageOfHeight:  withSecondTitle == true ? .01:0.0 ),
             withSecondTitle == true ? customDescriptionTextText(context: context, text: secondTitle , percentageOfHeight: .02 , maxLines: maxLines
              ) : SizedBox(),
              responsiveSizedBox(context: context, percentageOfHeight: .02),
              customDescriptionTextText(context: context, text: alertSubtitle , percentageOfHeight: .02 , maxLines: maxLines
              )
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(
              height(context) * .02,
            ),
            child: Row(
              children: [
                Container(
                  child: withTwoButtons == true
                      ? GestureDetector(
                          child:
                          customDescriptionTextText(context: context, text: secondButtoText ,
                              textColor: blueColor
                              , percentageOfHeight: .025 , fontWeight: FontWeight.bold ),
                       onTap: onTapSecondButton)
                      : SizedBox(),
                ),
                SizedBox(
                  width: width(context) * .05,
                ),
                GestureDetector(
                  child:
                  customDescriptionTextText(context: context, text: translator.translate("Cancel") , textColor: greyColor , percentageOfHeight: .023),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
