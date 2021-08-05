import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

customSingleBarberCardCard(
    {BuildContext context,
    String imagePath :"",
    String categoryTitle,
    Function onTapCard,
    bool isPlaceHolder: false,
    String englishName: "",
    String arabicName: "",
    String englishSpecification: "",
    String arabicSpecification: "",
    String arabicFees: "",
    String englishFees: "",
    bool  isCardForSaved : false ,
    int specialitiesLength: 1,
       List specificationList ,
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
                                                                :"${baseImageUrl}${imagePath}"),

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
                                              Row
                                                (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(width: width*.43,
                                                    child:  customDescriptionTextText(
                                                        percentageOfHeight: .02,
                                                        text: checkDirection(arabicName, englishName),
                                                        textAlign: TextAlign.start,
                                                        context: context,
                                                        textColor: blackColor,
                                                        fontWeight: FontWeight.bold),),
                                                  isCardForSaved == true ?  GestureDetector(onTap: (){},
                                                    child:Container(
                                                      child: Container( height: isLandscape(context)
                                                          ? 2 * height * .04
                                                          : height * .04,
                                                        width: width * .1,child:
                                                        Center(child:Icon(Icons.delete_outline ,color: blueColor,)),),),
                                                  )
                                                      :  SizedBox()


                                                ],),
                                              responsiveSizedBox(
                                                  context: context,
                                                  percentageOfHeight: .01),
                                              Row(
                                                children: [
                                                  customDescriptionTextText(
                                                      percentageOfHeight: .02,
                                                      text: translator.translate("Fees"),
                                                      context: context,
                                                      textAlign:
                                                          TextAlign.start),
                                                  SizedBox(width: width*.005,),
                                                  customDescriptionTextText(
                                                      percentageOfHeight: .02,
                                                      text: ":",
                                                      context: context,
                                                      textAlign:
                                                      TextAlign.start),
                                                  SizedBox(width: width*.005,),
                                                  customDescriptionTextText(
                                                      percentageOfHeight: .02,
                                                      text:  checkDirection(arabicFees, englishFees),
                                                      context: context,
                                                      textAlign:
                                                          TextAlign.start),

                                                ],
                                              ),
                                              responsiveSizedBox(
                                                  context: context,
                                                  percentageOfHeight: .02),
                                              Container(
                                                width: width *.57,
                                                height: isLandscape(
                                                    context)
                                                    ? 2 * height * .08
                                                    : height * .08,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: specificationList.length,
                                                    itemBuilder:
                                                        (context, subIndex) {
                                                      return Row(
                                                        children: [
                                                          SizedBox(width: width*.01,),
                                                          Neumorphic(
                                                            child: Container(
                                                                width: width * .3,
                                                                height: isLandscape(
                                                                        context)
                                                                    ? 2 * height * .05
                                                                    : height * .05,
                                                                decoration: BoxDecoration(
                                                                  color: whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                0)),
                                                                child: Center(
                                                                  child: customDescriptionTextText(
                                                                      context:
                                                                          context,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      text:
                                                                      checkDirection(specificationList[subIndex].nameAr,
                                                                          specificationList[subIndex].nameEn),),
                                                                )),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                              ),
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
