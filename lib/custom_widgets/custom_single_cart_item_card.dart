import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';

customSingleCartItemCard(
    {BuildContext context,
      String imagePath,
      Function onTapCard,
      bool isPlaceHolder: false,
      String englishName: "",
      String arabicName: "",
      String englishDescription : "",
      String arabicDescription : "",
      String arabicPrice: "",
      String englishPrice: "",
      int productQuantity : 1 ,
      Function onTapIncrease ,
      Function onTapDecrease ,
      Function onTapDeleteItem ,
      bool isShimmer: false}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Column(
    children: [
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
              child: InkWell(
                onTap: onTapCard,
                child: Container(
                  color: Colors.white,
                  child: Container(
                    child: isShimmer == true
                        ? customDefaultShimmerListView(context: context)
                        : Container(
                      child: isPlaceHolder == true
                          ? customDefaultPlaceHolderListView(context: context)
                          :
                      Container(
                        width: width * .9,
                        child: Row(
                          children: [
                            Container(
                              width: width * .3,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
//                              ------------------------- image
                                  Neumorphic(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                imagePath == null
                                                    ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJxMQ1Hx-kAq3vC1UmrjBHBdT0eU5Yci4x6m-XWv3QVpaUOd5QFmwNyTiRf09N1OmBAvQ&usqp=CAU"
                                                    : imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(
                                                  8)),
                                          color: backGroundColor),
                                      height: isLandscape(context)
                                          ? 2 * height * .2
                                          : height * .2,
                                      width: width * .3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * .03,
                            ),
                            Container(

                              width: width * .57,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .00),
                                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                   Container(width: width*.35,child: customDescriptionTextText(
                                       percentageOfHeight: .021,maxLines: 2,
                                       text: checkDirection(arabicName , englishName),
                                       textAlign: TextAlign.start,
                                       context: context,
                                       textColor: blackColor,
                                       fontWeight: FontWeight.bold)),


                                   GestureDetector(onTap: onTapDeleteItem,
                                     child: Container(padding: EdgeInsets.all(8),

                                       child: Neumorphic(
                                         child: Container(
                                           height: isLandscape(
                                               context)
                                               ? 2 * height * .05
                                               : height * .05,width: width*.12,
                                           color: whiteColor,
                                           child:  Icon(Icons.delete_outline, color: Colors.red.shade900,size: isLandscape(
                                               context)
                                               ? 2 * height * .04
                                               : height * .04,)
                                         ),
                                       ),
                                     ),
                                   ),

                                 ],),
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .005),
                                  customDescriptionTextText(
                                      percentageOfHeight: .02,
                                      text:  checkDirection(arabicDescription ,englishDescription ),context: context,
                                      textAlign:
                                      TextAlign.start , maxLines: 2),
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .005),
                                  customDescriptionTextText(
                                      percentageOfHeight: .02,
                                      text:  checkDirection(arabicPrice ,englishPrice),context: context,
                                      textAlign:
                                      TextAlign.start , maxLines: 2 ,textColor: blackColor ,fontWeight: FontWeight.bold),
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .02),
                                  Container(padding: EdgeInsets.only(right: width*.07, left: width*.07),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                      GestureDetector(onTap: onTapIncrease,
                                        child: Neumorphic(
                                          child: Container(
                                            height: isLandscape(
                                                context)
                                                ? 2 * height * .05
                                                : height * .05,width: width*.12,
                                            color: whiteColor,
                                            child: Icon(Icons.add, color:blueColor
                                              ,size: isLandscape(
                                                  context)
                                                  ? 2 * height * .04
                                                  : height * .04,),
                                          ),
                                        ),
                                      ),

                                      customDescriptionTextText(
                                          percentageOfHeight: .025,
                                          text: checkDirection(productQuantity.toString(),productQuantity.toString()),
                                          textAlign: TextAlign.start,
                                          context: context,
                                          textColor: blackColor,
                                          fontWeight: FontWeight.bold),
                                      GestureDetector(onTap: onTapDecrease,
                                        child: Neumorphic(
                                          child: Container(
                                            height: isLandscape(
                                                context)
                                                ? 2 * height * .05
                                                : height * .05,width: width*.12,
                                            color: whiteColor,
                                            child: Icon(Icons.remove, color:blueColor
                                              ,size: isLandscape(
                                                context)
                                                ? 2 * height * .04
                                                : height * .04,),
                                          ),
                                        ),
                                      )
                                    ],),

                                  ),
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .02),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      responsiveSizedBox(context: context, percentageOfHeight: .03),


    ],
  );
}

