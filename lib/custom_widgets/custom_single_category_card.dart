import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/products/all_products_screen.dart';
customSingleCategoryCard(
    {BuildContext context,
    String imagePath,
    String categoryTitle,
    Function onTapCard,
    bool isPlaceHolder: false,
    String arabicTitle: "",
    String englishTitle: "",
    bool isShimmer: false}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Row(
    children: [
      SizedBox(
        width: width * .05,
      ),
      Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            depth: isShimmer == true ? 0 : 3,
            lightSource: LightSource.bottom,
            shadowLightColor: Colors.black,
//                        shadowDarkColor: Colors.grey ,
            color: backGroundColor),
        child: Container(
          child: InkWell(
            onTap: onTapCard ,
            child: Container(
              color: Colors.white,
              child: Container(
                child: isShimmer == true
                    ? Container(
                        child: Shimmer.fromColors(
                            highlightColor: greyColor.withOpacity(.1),
                            baseColor: greyColor.withOpacity(.3),
                            direction: checkDirection(
                              ShimmerDirection.rtl,
                              ShimmerDirection.ltr,
                            ),
                            child: Container(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              color: blueColor.withOpacity(.3)),
                                          height: isLandscape(context)
                                              ? 2 * height * .2
                                              : height * .2,
                                          width: width * .4,
                                        ),
                                      ],
                                    )))))
                    : Container(
                        child: isPlaceHolder == true
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: isPlaceHolder == true
                                          ? AssetImage(AppImages.place_holder)
                                          : NetworkImage(""),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: blueColor.withOpacity(.3)),
                                height: isLandscape(context)
                                    ? 2 * height * .2
                                    : height * .2,
                                width: width * .4,
                              )
                            : Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(imagePath == null
                                              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJxMQ1Hx-kAq3vC1UmrjBHBdT0eU5Yci4x6m-XWv3QVpaUOd5QFmwNyTiRf09N1OmBAvQ&usqp=CAU"
                                              : "${baseImageUrl}${imagePath}"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: backGroundColor),
                                    height: isLandscape(context)
                                        ? 2 * height * .2
                                        : height * .2,
                                    width: width * .4,
                                  ),
                                  Container(
                                    height: isLandscape(context)
                                        ? 2 * height * .2
                                        : height * .2,
                                    width: width * .4,
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      child: Center(
                                          child: customDescriptionTextText(
                                              context: context,
                                              textColor: whiteColor,
                                              fontWeight: FontWeight.bold,
                                              text: checkDirection(
                                                  arabicTitle, englishTitle),
                                              percentageOfHeight: .02,
                                              maxLines: 1)),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(8)),
                                          color: blueColor.withOpacity(.3)),
                                      height: isLandscape(context)
                                          ? 2 * height * .06
                                          : height * .06,
                                      width: width * .4,
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
    ],
  );
}
