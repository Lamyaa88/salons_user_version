import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';

customDefaultShimmerListView({BuildContext context})
{
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return     Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: height ,width: width*.9,
        padding: EdgeInsets.only(
            top: height * .01),
        child: ListView.builder(
//                                shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 10 ,
          itemBuilder: (context, index) {
            return
             customDefaultShimmerCard(context: context) ;
          },
        ),
      ),
    ],
  );
}
customDefaultShimmerCard({BuildContext context})
{
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    width: width * .9,
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          width: width * .3, height: isLandscape(context)
            ? 2 * height * .15
            : height * .15,

          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
//                              ------------------------- image
              Container(
                  child:
                  Shimmer.fromColors(
                    highlightColor: greyColor.withOpacity(.05),
                    baseColor: blueColor.withOpacity(.3),
                    direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                    child:   Container(
                      color: backGroundColor ,
                      height: isLandscape(context)
                          ? 2 * height * .15
                          : height * .15,
                      width: width * .3,
                    ),)


              ),
            ],
          ),
        ),
        SizedBox(
          width: width * .03,
        ),
        Container(
          height: isLandscape(context)
              ? 2 * height * .15
              : height * .15,

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
                  percentageOfHeight: .01),
              Shimmer.fromColors(
                highlightColor: greyColor.withOpacity(.05),
                baseColor: blueColor.withOpacity(.3),
                direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                child:   Container(
                  color: backGroundColor ,
//                                        decoration: BoxDecoration(
//                                            borderRadius:
//                                            BorderRadius.all(
//                                                Radius.circular(
//                                                    8)),
//                                            color: backGroundColor),
                  height: isLandscape(context)
                      ? 2 * height * .03
                      : height * .03,
                  width: width * .56,
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
//                                        decoration: BoxDecoration(
//                                            borderRadius:
//                                            BorderRadius.all(
//                                                Radius.circular(
//                                                    8)),
//                                            color: backGroundColor),
                  height: isLandscape(context)
                      ? 2 * height * .025
                      : height * .025,
                  width: width * .45,
                ),),
              responsiveSizedBox(
                  context: context,
                  percentageOfHeight: .02),
              Row(
                children: [
                  Shimmer.fromColors(
                    highlightColor: greyColor.withOpacity(.05),
                    baseColor: blueColor.withOpacity(.3),
                    direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),

                    child:   Container(
                      color: backGroundColor ,
//                                        decoration: BoxDecoration(
//                                            borderRadius:
//                                            BorderRadius.all(
//                                                Radius.circular(
//                                                    8)),
//                                            color: backGroundColor),
                      height: isLandscape(context)
                          ? 2 * height * .02
                          : height * .02,
                      width: width * .2,
                    ),),
                  SizedBox(width: width*.05,),
                  Shimmer.fromColors(
                    highlightColor: greyColor.withOpacity(.05),
                    baseColor: blueColor.withOpacity(.3),
                    direction: checkDirection( ShimmerDirection.rtl, ShimmerDirection.ltr,),


                    child:   Container(
                      color: backGroundColor ,
//                                        decoration: BoxDecoration(
//                                            borderRadius:
//                                            BorderRadius.all(
//                                                Radius.circular(
//                                                    8)),
//                                            color: backGroundColor),
                      height: isLandscape(context)
                          ? 2 * height * .02
                          : height * .02,
                      width: width * .2,
                    ),),
                ],
              ),
              responsiveSizedBox(
                  context: context,
                  percentageOfHeight: .02),

            ],
          ),
        ),
      ],
    ),
  ) ;
}


