import 'package:almezyn/utils/file_export.dart';
singleSalonCard(
    {BuildContext context,
    String imagePath,
    String salonName,
    String salonDescription,
    String salonLocation,
    Function onTapSingleSalon}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(onTap: onTapSingleSalon,
        child: Container(
          margin: EdgeInsets.only(bottom:isLandscape(context) ? 2 * height * .02 : height * .02, ),
      height:  isLandscape(context) ? 2 * height * .12 : height * .12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: isLandscape(context) ? 2 * height * .1 : height * .1,
                    width: width * .2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(
                              AppImages.place_holder,
                            ),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
              SizedBox(
                width: width * .04,
              ),
              Container(
                width: width * .6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDescriptionTextText(
                        context: context,
                        text: salonName,
                        percentageOfHeight: .025,
                        textColor: blackColor,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold),
                    customDescriptionTextText(
                      context: context,
                      text: salonDescription ,
                      percentageOfHeight: .022,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: isLandscape(context)
                              ? 2 * height * .02
                              : height * .02,
                          color: greyColor,
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        customDescriptionTextText(
                          context: context,
                          text: salonLocation ,
                          percentageOfHeight: .02,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
