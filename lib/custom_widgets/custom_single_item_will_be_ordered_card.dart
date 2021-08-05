import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

customSingleItemWillBeOrderedCard(
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
                      Container(padding: EdgeInsets.only(right: width*.05 ,left: width*.05),
                        width: width * .9,
                        child:  Container(

                            width: width * .7,
                            child: Column(
                              children: [
                                responsiveSizedBox(context: context , percentageOfHeight: .02),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text:translator.translate("Item:"),
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),


                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text: checkDirection(arabicName ,englishName ),
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),],),   responsiveSizedBox(context: context , percentageOfHeight: .02),

                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text:translator.translate("Quantity:"),
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),


                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text: checkDirection("2","2"),
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),],),
                                responsiveSizedBox(context: context , percentageOfHeight: .02),

                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text:translator.translate("Item Price:") ,
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),



                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text: checkDirection("\$ 50" ,"\$ 50 "),
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),],),
                                responsiveSizedBox(context: context , percentageOfHeight: .02),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text:translator.translate("Total Price") ,
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),



                                  customDescriptionTextText(
                                    percentageOfHeight: .02,
                                    text: checkDirection("\$ 100" ,"\$ 100" ),
                                    textAlign: TextAlign.start,
                                    context: context,
                                    textColor: blackColor,
                                  ),],),
                                responsiveSizedBox(context: context , percentageOfHeight: .02),

                              ],
                            )
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

