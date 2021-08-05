import 'package:almezyn/utils/file_export.dart';

singleBarberCard({BuildContext context , String imagePath , String rating  , String name , String speciality , List specialityList  }){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Row(

    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(
            bottom: isLandscape(context) ? 2 * height * .02 : height * .02,
          ),
          height: isLandscape(context) ? 2 * height * .2 : height * .2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: isLandscape(context) ? 2 * height * .15 : height * .15,
                    width: width * .26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                            imagePath
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
                    customDescriptionTextText(context: context, text: name ),
                    responsiveSizedBox(context: context, percentageOfHeight: .01),
                    Container(
                        width: width * .5,
                        height: height * .05,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: specialityList.length,
                            itemBuilder: (context, indexOfspecifications) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(borderRadius:
                                    BorderRadius.circular(3), color: blueColor.withOpacity(.2)),
                                    width: width * .25,
                                    height: height * .04,
                                    child: Center(
                                      child: customDescriptionTextText(context: context,textColor:
                                      whiteColor, text: speciality ),
                                    ),
                                  ),
                                ],
                              );
                            })),
                    responsiveSizedBox(context: context, percentageOfHeight: .01),
                    Row(
                      children: [
                        SizedBox(
                          width: width * .02,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: yellowColor,
                        ),
                        customDescriptionTextText(
                          context: context,
                          text: "5.0",
                          percentageOfHeight: .02,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          width: width * .2,
                        ),
                        Row(
                          children: [
                            customDescriptionTextText(context: context, text: "Fees", percentageOfHeight: .02, textAlign: TextAlign.start, fontWeight: FontWeight.bold, textColor: blueColor),
                            SizedBox(
                              width: width * .02,
                            ),
                            customDescriptionTextText(
                              context: context,
                              text: "\$ 55",
                              percentageOfHeight: .02,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        )
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