import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
salonDetailsFirsTap(
    {BuildContext context,
    String imagePath: "",
    String arabicSalonName: "",
      String englishSalonName: "",
      String arabicSalonAddress: "",
      String englishSalonAddress: "",
      String arabicSalonDescription: "" ,
      String englishSalonDescription: "" ,
      String arabicService :"" ,
      String englishService :"" ,
      List servicesList  ,
    Function onTapAddToSavedList
    }) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return NetworkIndicator(
    child: Container(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: null,
              expandedHeight:
                  isLandscape(context) ? 2 * height * .3 : height * .3,
              backgroundColor: whiteColor,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: isLandscape(context) ? 2 * height * .3 : height * .3,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${baseImageUrl}${imagePath}"),
                      fit: isLandscape(context)
                          ? BoxFit.fitHeight
                          : BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: width * .05, left: width * .05),
                height: height * .75,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      responsiveSizedBox(
                          context: context, percentageOfHeight: .03),
                      Row(
                        children: [
                          customDescriptionTextText(
                              context: context,
                              text: checkDirection(arabicSalonName, englishSalonName),
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              percentageOfHeight: .03,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.black),
                        ],
                      ),
                      responsiveSizedBox(
                          context: context, percentageOfHeight: .02),
                      Row(
                        children: [
                          Container(
                            width: width * .9,
                            child: customDescriptionTextText(
                                context: context,
                                text: checkDirection(arabicSalonDescription,englishSalonDescription),
                                maxLines: 10,
                                textAlign: TextAlign.start,
                                percentageOfHeight: .02,
                                textColor: Colors.black),
                          )
                        ],
                      ),
                      responsiveSizedBox(
                          context: context, percentageOfHeight: .02),
                      Row(
                        children: [
                          customDescriptionTextText(
                              context: context,
                              text: translator.translate("Address :"),
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              percentageOfHeight: .03,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.black),
                        ],
                      ),
                      responsiveSizedBox(
                          context: context, percentageOfHeight: .02),
                      Row(
                        children: [
                          Container(
                            width: width * .9,
                            child: customDescriptionTextText(
                                context: context,
                                text: checkDirection( arabicSalonAddress,englishSalonAddress),
                                maxLines: 10,
                                textAlign: TextAlign.start,
                                percentageOfHeight: .02,
                                textColor: Colors.black),
                          )
                        ],
                      ),
                      responsiveSizedBox(
                          context: context, percentageOfHeight: .02),
                      Row(
                        children: [
                          customDescriptionTextText(
                              context: context,
                              text: translator.translate("Services :"),
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              percentageOfHeight: .03,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.black),
                        ],
                      ),
                      responsiveSizedBox(
                          context: context, percentageOfHeight: .02),
                      Container(
                        height: height * .3,
                        child: ListView.builder(
//                                              shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: servicesList.length ,
                            itemBuilder: (context, subIndex) {
                              return Container(
                                margin: EdgeInsets.only(
                                    bottom: isLandscape(context)
                                        ? 2 * height * .03
                                        : height * .03),
                                child: Row(
                                  children: [
                                    Neumorphic(
                                      child: Container(
                                        width: width * .88,
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(

                                                      "${baseImageUrl}${servicesList[subIndex].image}"),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: backGroundColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(0)),
                                              ),
                                              height: isLandscape(context)
                                                  ? 2 * height * .08
                                                  : height * .08,
                                              width: width * .2,
                                            ),
                                            Container(
                                                child: Container(
                                              width: width * .68,
                                              height: isLandscape(context)
                                                  ? 2 * height * .08
                                                  : height * .08,
                                              decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(0)),
                                              child: Center(
                                                  child:
                                                      customDescriptionTextText(
                                                          context: context,
                                                          textAlign:
                                                              TextAlign.start,
                                                          text: checkDirection(
                                                              servicesList[subIndex].nameAr,
                                                            servicesList[subIndex].nameEn,
                                                          ))),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: "Add to saved list ", onTapButton: onTapAddToSavedList,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
