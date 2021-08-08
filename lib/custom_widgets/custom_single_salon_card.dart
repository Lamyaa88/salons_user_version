import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

customSingleSalonCard(
    {BuildContext context,
      String imagePath,
      String imagePath2,
      Function onTapCard,
      bool isPlaceHolder: false,
      String englishName: "",
      String arabicName: "",
      Function onTapDeleteFromSaved ,
      String englishDescription : "",
      String arabicDescription : "",
      String englishSpeciality: "",
      String arabicSpeciality: "",
       int specialitySubIndex ,
      bool isCardForSavedLIst : false,
      int specialitiesLength: 1,
      List specialitiesList ,
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
                                                    :imagePath),
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
                              width: width * .02,
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
                                  Container(
                                    child: Row
                                      (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                     Container(width: width*.43,
                                       child:  customDescriptionTextText(
                                         percentageOfHeight: .024,
                                         text: checkDirection(arabicName, englishName),
                                         textAlign: TextAlign.start,
                                         context: context,
                                         textColor: blackColor,
                                         fontWeight: FontWeight.bold),),
                                        isCardForSavedLIst == true ?  GestureDetector(onTap: onTapDeleteFromSaved ,
                                          child:Container(
                                            child: Container( height: isLandscape(context)
                                                ? 2 * height * .04
                                                : height * .04,
                                              width: width * .1,child:
                                              Center(child:Icon(Icons.delete_outline ,color: blueColor,)),),),
                                        )
                                            :  SizedBox()


                                      ],),
                                  ),
                                  responsiveSizedBox(
                                      context: context,
                                      percentageOfHeight: .01),
                                  customDescriptionTextText(
                                      percentageOfHeight: .02,
                                      text:  checkDirection(arabicDescription ,englishDescription ),context: context,
                                      textAlign:
                                      TextAlign.start , maxLines: 2),
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
                                        itemCount: specialitiesLength,
                                        itemBuilder:
                                            (context, subIndex ) {
                                          return Row(
                                            children: [
                                              SizedBox(width: width*.02,),
                                              Neumorphic(
                                                child: Container(
                                                  child: Row(
                                                    children: [

                                                       Container(
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(

                                                              image: NetworkImage(
                                                                  imagePath == null
                                                                      ? "https://encrypted-tbn0.gscTJxMQ1Hx-kAq3vC1UmrjBHBdT0eU5Yci4x6m-XWv3QVpaUOd5QFmwNyTiRf09N1OmBAvQ&usqp=CAU"
                                                                      :"${baseImageUrl}${specialitiesList[subIndex].image}"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                            color: backGroundColor,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    0)),
                                                          ),
                                                          height: isLandscape(context)
                                                              ? 2 * height * .05
                                                              : height * .05,
                                                          width: width * .1,
                                                        ),

                                                     Container(
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
                                                      specialitiesList == null ?checkDirection("قص الشعر", "Hair Cut") :

                                                                checkDirection(specialitiesList[subIndex].nameAr ,specialitiesList[subIndex].nameEn),),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
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



