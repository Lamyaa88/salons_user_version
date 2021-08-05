import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';

customSingleOrderItemCard(
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
      String arabicQuantity :"1" ,
      String englishQuantity : "1",
      String orderStatusEnglish:"pending" ,
      String orderStatusArabic :"",
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
                                  customDescriptionTextText(
                                      percentageOfHeight: .025,
                                      text: checkDirection(arabicName , englishName),
                                      textAlign: TextAlign.start,
                                      context: context,
                                      textColor: blackColor,
                                      fontWeight: FontWeight.bold),
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
                                      percentageOfHeight: .01),
                                  Row(
                                    children: [
                                    customDescriptionTextText(
                                        percentageOfHeight: .02,
                                        text: "Price",context: context,
                                        textAlign:
                                        TextAlign.start , maxLines: 2 ,textColor: blackColor ,),
                                    customDescriptionTextText(
                                        percentageOfHeight: .02,
                                        text: " : ",context: context,
                                        textAlign:
                                        TextAlign.start , maxLines: 2 ,textColor: blackColor ),
                                    customDescriptionTextText(
                                        percentageOfHeight: .02,
                                        text:  checkDirection(arabicPrice ,englishPrice),context: context,
                                        textAlign:
                                        TextAlign.start , maxLines: 2 ,textColor: blackColor ),
                                    SizedBox(width: width*.02,),


                                    customDescriptionTextText(
                                        percentageOfHeight: .02,
                                        text: "Quantitiy",context: context,
                                        textAlign:
                                        TextAlign.start , maxLines: 2 ,textColor: blackColor ),
                                    customDescriptionTextText(
                                        percentageOfHeight: .02,
                                        text: " : ",context: context,
                                        textAlign:
                                        TextAlign.start , maxLines: 2 ,textColor: blackColor ),
                                    customDescriptionTextText(
                                        percentageOfHeight: .02,
                                        text:  checkDirection(arabicQuantity ,englishQuantity),context: context,
                                        textAlign:
                                        TextAlign.start , maxLines: 2 ,textColor: blackColor ,)
                                  ],),
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .01),
                                  customDescriptionTextText(
                                      percentageOfHeight: .025,
                                      text:  checkDirection(orderStatusArabic , orderStatusEnglish),context: context,
                                      textAlign:
                                      TextAlign.start , maxLines: 2 ,textColor: orangeColor ,fontWeight: FontWeight.bold),
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .01),
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

