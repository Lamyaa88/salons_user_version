import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

customSingleAddressCardCard(
    {BuildContext context,
    Function onTapDelete,
    bool isPlaceHolder: false,
    String englishName: "",
    String arabicName: "",
    bool isShimmer: false}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      responsiveSizedBox(context: context, percentageOfHeight: .015),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                depth: isShimmer == true ? 3 : 3,
                lightSource: LightSource.bottom,
                shadowLightColor: Colors.grey,
                color: backGroundColor),
            child: Container(

                child: Container(
                  color: Colors.white,
                  child: Container(
                    child: isShimmer == true
                        ? Container(
                      width: width * .9,
                      child: Row(
                        children: [
                          SizedBox(width: width*.02,),
                          Container(
                            width: width * .86,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                responsiveSizedBox(
                                    context: context,
                                    percentageOfHeight: .01),
                                Shimmer.fromColors(
                                  highlightColor: greyColor.withOpacity(.05),
                                  baseColor: blueColor.withOpacity(.3),
                                  direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                                  child:   Container(
                                    color: backGroundColor ,
                                    height: isLandscape(context)
                                        ? 2 * height * .02
                                        : height * .02,
                                    width: width * .2,
                                  ),),
                                responsiveSizedBox(
                                    context: context,
                                    percentageOfHeight: .02),
                                Shimmer.fromColors(
                                  highlightColor: greyColor.withOpacity(.05),
                                  baseColor: blueColor.withOpacity(.3),
                                  direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                                  child:   Container(
                                    color: backGroundColor ,
                                    height: isLandscape(context)
                                        ? 2 * height * .015
                                        : height * .015,
                                    width: width * .86,
                                  ),),
                                responsiveSizedBox(
                                    context: context,
                                    percentageOfHeight: .02),
                                Shimmer.fromColors(
                                  highlightColor: greyColor.withOpacity(.05),
                                  baseColor: blueColor.withOpacity(.3),
                                  direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                                  child:   Container(
                                    color: backGroundColor ,
                                    height: isLandscape(context)
                                        ? 2 * height * .015
                                        : height * .015,
                                    width: width * .86,
                                  ),),
                                responsiveSizedBox(
                                    context: context,
                                    percentageOfHeight: .02),
                                Shimmer.fromColors(
                                  highlightColor: greyColor.withOpacity(.05),
                                  baseColor: blueColor.withOpacity(.3),
                                  direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                                  child:   Container(
                                    color: backGroundColor ,
                                    height: isLandscape(context)
                                        ? 2 * height * .015
                                        : height * .015,
                                    width: width * .86,
                                  ),),
                                responsiveSizedBox(
                                    context: context,
                                    percentageOfHeight: .02),
                                Shimmer.fromColors(
                                  highlightColor: greyColor.withOpacity(.05),
                                  baseColor: blueColor.withOpacity(.3),
                                  direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                                  child:   Container(
                                    color: backGroundColor ,
                                    height: isLandscape(context)
                                        ? 2 * height * .015
                                        : height * .015,
                                    width: width * .86,
                                  ),),
                                responsiveSizedBox(
                                    context: context,
                                    percentageOfHeight: .02),

                              ],
                            ),
                          ),
                          SizedBox(width: width*.02,),

                        ],
                      ),
                    )
                        : Container(
                            child: isPlaceHolder == true
                                ? customDefaultPlaceHolderListView(
                                    context: context)
                                : Container(
                                    width: width * .9,
                                    child: Column(
                                      children: [
                                        responsiveSizedBox(context: context , percentageOfHeight: .02),
                                        Container(    padding: EdgeInsets.only(right: width*.02, left: width*.02),

                                            width: width * .9,
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                customDescriptionTextText(context: context , text: "" ,
                                                    fontWeight: FontWeight.bold , textColor:blackColor) ,
                                                GestureDetector(
                                                  onTap: onTapDelete ,
                                                  child: Icon(
                                                    Icons.delete_outline,
                                                    color:
                                                    Colors.red.shade900,
                                                    size:
                                                    isLandscape(context)
                                                        ? 2 *
                                                        height *
                                                        .04
                                                        : height * .04,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(    padding: EdgeInsets.only(right: width*.02, left: width*.02),

                                            width: width * .9,
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                              children: [
                                              Container(child:   customDescriptionTextText(context:
                                              context , text: checkDirection(arabicName, englishName) ,
                                                  textColor:blackColor  , maxLines: 10 , textAlign: TextAlign.start) , width: width*.86)

                                              ],
                                            )),
                                        responsiveSizedBox(context: context , percentageOfHeight: .02),

                                      ],
                                    ),
                                  ),
                          ),
                  ),
                ),
              ),
            ),

        ],
      ),
      responsiveSizedBox(context: context, percentageOfHeight: .015),
    ],
  );
}
