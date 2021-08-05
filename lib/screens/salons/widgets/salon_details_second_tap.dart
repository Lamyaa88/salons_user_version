import 'package:almezyn/screens/barbers/single_barber_details.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';

salonDetailsSecondTap(
    {BuildContext context,
    String barberArabicName :"",
    String barberEnglishName :"",
    String barberFees :"",
    List listOfServices,
    String imagePath :""}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return SingleChildScrollView(
    child: Column(
      children: [
        responsiveSizedBox(context: context, percentageOfHeight: .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * .9,
              child: customDescriptionTextText(
                context: context,
                text: checkDirection("يمكنك اختيار حلاق لحجز موعد معه ",
                    "You can choose a barber to book Appointment with"),
                maxLines: 10,
                percentageOfHeight: .015,
              ),
            )
          ],
        ),
        responsiveSizedBox(context: context, percentageOfHeight: .02),
        Container(
          height: height,
          child: ListView.builder(
//                                         shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return customSingleBarberCardCard(
                    context: context,
                    arabicName: barberArabicName,
                    englishName:  barberEnglishName,
                    arabicSpecification: "قص الشعر",
                    englishSpecification: "Hair Cut",
                    specialitiesLength: 10,
                    arabicFees: " \$ 50",
                    englishFees: " \ 50",
                    onTapCard: () {
                      customAnimatedPushNavigation(
                          context, SingleBarberDetailsScreen());
                    },
                    imagePath:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSqEFTzhbCzNO_A6omZxnhpm0RtNXvjqeXCg&usqp=CAU");
              }),
        ),
      ],
    ),
  );
}
