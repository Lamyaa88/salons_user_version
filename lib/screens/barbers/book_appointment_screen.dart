import 'package:almezyn/Models/salons_models/single_salon_model.dart';
import 'package:almezyn/app_cubits/users/single_barber_cubit/single_barber_cubit.dart';
import 'package:almezyn/app_cubits/users/single_barber_cubit/single_barber_state.dart';
import 'package:almezyn/screens/appointment/home_appointment.dart';
import 'package:almezyn/screens/barbers/book_appointment_screen.dart';
import 'package:almezyn/screens/salons/widgets/top_slider.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:almezyn/screens/barbers/get_appointment_location_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  final barberId;
  final salonId;
  BookAppointmentScreen({this.barberId, this.salonId});
  @override
  _BookAppointmentScreenState createState() =>
      _BookAppointmentScreenState(barberId, salonId);
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  final barberId;
  final salonId;
  var selectedItemList;
  List<String> _checked = ["A", "B"];
  bool borderColorForService = false;
  bool borderColorForTime = false;

  int selectedForService ;
  int selectedForTime ;

  int sentServiceIdToApi ;
  int sentTimeIdToApi ;
  TextEditingController _description = TextEditingController();


  _BookAppointmentScreenState(this.barberId, this.salonId);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: whiteColor,
      child: BlocProvider(
        create: (BuildContext context) =>
        SingleBarberCubit()..getSingleBarber(id: barberId),
        child: BlocConsumer<SingleBarberCubit, SingleBarberStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SingleBarberCubit.get(context);

            if (state is! SingleBarberLoadingState) {
              return Scaffold(
                backgroundColor: whiteColor,
                body: Container(
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * .85,padding: EdgeInsets.only(right: width*.05 , left: width*.05),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [

                                responsiveSizedBox(
                                    context: context, percentageOfHeight: .05),
                                Row(
                                  children: [
                                    customDescriptionTextText(
                                        context: context,
                                        text: "Choose a service :",
                                        percentageOfHeight: .025,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.bold,
                                        textColor: blackColor),
                                  ],
                                ),
                                Container(height: height*.35,child:
                                ListView.builder(
//                                              shrinkWrap: true,
                                    physics:
                                    BouncingScrollPhysics(),
                                    scrollDirection:
                                    Axis.vertical,
                                    itemCount:cubit.singleBarberMap["data"]["services"].length ,
                                    itemBuilder:
                                        (context, index ) {
                                      return  Column(
                                        children: [
                                          responsiveSizedBox(context: context , percentageOfHeight: .05),
                                          GestureDetector(onTap: (){
                                            setState(() {
                                              borderColorForService =!borderColorForService ;
                                              print(index + 1);
                                              selectedForService = (index) ;
                                              print("selected is ${selectedForService} and index is ${index}");
                                              sentServiceIdToApi = (index) ;
                                              print("sent to api is ${sentServiceIdToApi}") ;});

                                          },
                                            child: Container(height: height*.1,
                                                alignment: Alignment.center,
                                                width: width*.9,
                                                decoration:
                                                BoxDecoration(border: Border.all(color: selectedForService == index ? blueColor : greyColor, width: 2)),
                                                child: customDescriptionTextText(
                                                    textColor: blackColor,
                                                    fontWeight: FontWeight.bold,
                                                    context:
                                                    context,
                                                    textAlign:
                                                    TextAlign
                                                        .start,
                                                    text:checkDirection(cubit.singleBarberMap["data"]["services"][index]["name_en"]
                                                        ,cubit.singleBarberMap["data"]["services"][index]["name_en"] )

                                                )),
                                          ),],
                                      );
                                    }),),
                                Row(
                                  children: [
                                    customDescriptionTextText(
                                        context: context,
                                        text: "Choose appointment time :",
                                        percentageOfHeight: .025,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.bold,
                                        textColor: blackColor),
                                  ],
                                ),
                                Container(height: height*.35,
                                  child:
                                ListView.builder(
//                                              shrinkWrap: true,
                                    physics:
                                    BouncingScrollPhysics(),
                                    scrollDirection:
                                    Axis.vertical,
                                    itemCount:cubit.singleBarberMap["data"]["availability"].length ,
                                    itemBuilder:
                                        (context, index ) {
                                      return  Column(
                                        children: [
                                          responsiveSizedBox(context: context , percentageOfHeight: .05),
                                          GestureDetector(onTap: (){
                                            setState(() {
                                              borderColorForTime =!borderColorForTime ;
                                              print(index + 1);
                                              selectedForTime = (index) ;
                                              print("selected is ${selectedForTime} and index is ${index}");
                                              sentTimeIdToApi = (index) ;
                                              print("sent to api is ${sentTimeIdToApi}") ;});

                                          },
                                            child: Container(
                                                alignment: Alignment.center,
                                                width: width*.9,
                                                decoration:
                                                BoxDecoration(border: Border.all(color: selectedForTime == index ? blueColor : greyColor, width: 2)),
                                                child: Column(
                                                  children: [
                                                    responsiveSizedBox(
                                                        context: context,
                                                        percentageOfHeight:
                                                        .03),

                                                     Container(
                                                        padding:
                                                        EdgeInsets.only(right: width*.02 , left: width*.02),
                                                        width: width * .9,
                                                        decoration: BoxDecoration(
                                                            color: whiteColor,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8)),
                                                        child: Column(
                                                          children: [
                                                            responsiveSizedBox(
                                                                context:
                                                                context,
                                                                percentageOfHeight:
                                                                .02),
                                                            Row(
                                                              children: [
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text:
                                                                    "date : ",
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text: cubit.singleBarberMap["data"]["availability"][index]["date"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][index]
                                                                    [
                                                                    "date"]),
                                                              ],
                                                            ),
                                                            responsiveSizedBox(
                                                                context:
                                                                context,
                                                                percentageOfHeight:
                                                                .02),
                                                            Row(
                                                              children: [
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text:
                                                                    "day : ",
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text: cubit.singleBarberMap["data"]["availability"][index]["day"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][index]
                                                                    [
                                                                    "day"]),
                                                              ],
                                                            ),
                                                            responsiveSizedBox(
                                                                context:
                                                                context,
                                                                percentageOfHeight:
                                                                .02),
                                                            Row(
                                                              children: [
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text:
                                                                    "from : ",
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text: cubit.singleBarberMap["data"]["availability"][index]["start_time"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][index]
                                                                    [
                                                                    "start_time"]),
                                                              ],
                                                            ),
                                                            responsiveSizedBox(
                                                                context:
                                                                context,
                                                                percentageOfHeight:
                                                                .02),
                                                            Row(
                                                              children: [
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text:
                                                                    "to : ",
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                customDescriptionTextText(
                                                                    context:
                                                                    context,
                                                                    text: cubit.singleBarberMap["data"]["availability"][index]["end_date"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][index]
                                                                    [
                                                                    "end_date"]),
                                                              ],
                                                            ),
                                                            responsiveSizedBox(
                                                                context:
                                                                context,
                                                                percentageOfHeight:
                                                                .02),
                                                          ],
                                                        ),
                                                      ),

                                                  ],
                                                )),
                                          ),],
                                      );
                                    }),),
                                responsiveSizedBox(
                                    context: context, percentageOfHeight: .01),
                                Row(
                                  children: [
                                    customDescriptionTextText(
                                        context: context,
                                        text: "Description :",
                                        percentageOfHeight: .025,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.bold,
                                        textColor: blackColor),
                                  ],
                                ),
                                responsiveSizedBox(
                                    context: context, percentageOfHeight: .01),
                                CustomTextField(hint: "write your notes ", controller: _description,) ,
                                responsiveSizedBox(
                                    context: context, percentageOfHeight: .01),

                              ],
                            ),
                          ),
                        ),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .05),
                        CustomButton(
                          text: "Confirm Booking",
                          onTapButton: () {
                            DioHelper.postData(
                              url: "/book-appointment",
                              data: {
                                "appointment_date" :  cubit.singleBarberMap["data"]["availability"][sentTimeIdToApi]["date"] ,
                                "appointment_time" :cubit.singleBarberMap["data"]["availability"][sentTimeIdToApi]["start_time"]  ,
                                "description":_description.text ,
                                "barber_id":barberId,
                                "salon_id":salonId,
                                "speciality_ids":cubit.singleBarberMap["data"]["services"][sentServiceIdToApi]["id"],
                                "day":cubit.singleBarberMap["data"]["availability"][sentTimeIdToApi]["day"] ,
                                "address_id" :""},
                              token: token,
                            ).then(
                                  (value) {
                                print(value);
                                if(value.statusCode == 200) {
                                  ScaffoldMessenger.of(
                                      context)
                                      .showSnackBar(
                                      SnackBar(
                                        content: Text(value.data["message"]),
                                      ));
                                  customPushNamedNavigation(context, AppointmentsHomeScreen());
                                }
                              },
                            );

                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return spinKit;
          },
        ),
      ),
    );
  }



  Future showCustomAlertDialog(
      {BuildContext context,
        String alertTitle,
        String alertSubtitle,
        Function onTapHome,
        Function onTapSalon}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: isLandscape(context)
                ? .7 * width(context) * .95
                : width(context) * .95,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
//                responsiveSizedBox(context: context, percentageOfHeight: .02),
                Container(
                  height: isLandscape(context)
                      ? 2 * height(context) * .25
                      : height(context) * .25,
                  width: width(context) * .5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/jump.gif"),
                          fit: BoxFit.fill)),
                ),
                responsiveSizedBox(context: context, percentageOfHeight: .0),
                customBoldText(context: context, text: alertTitle),
                responsiveSizedBox(context: context, percentageOfHeight: .02),
                customDescriptionTextText(
                    context: context, text: alertSubtitle, maxLines: 40),
                responsiveSizedBox(context: context, percentageOfHeight: .02),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(
                height(context) * .02,
              ),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                    child: customDescriptionTextText(
                        context: context,
                        text: translator.translate("Home"),
                        textColor: blueColor,
                        percentageOfHeight: .022,
                        fontWeight: FontWeight.bold),
                    onTap: onTapHome),
                SizedBox(
                  width: width(context) * .05,
                ),
                GestureDetector(
                    child: customDescriptionTextText(
                        context: context,
                        text: translator.translate("Salon"),
                        percentageOfHeight: .022,
                        fontWeight: FontWeight.bold,
                        textColor: blueColor),
                    onTap: onTapSalon)
              ]),
            ),
          ],
        );
      },
    );
  }
}

