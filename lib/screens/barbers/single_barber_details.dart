import 'package:almezyn/app_cubits/users/single_barber_cubit/single_barber_cubit.dart';
import 'package:almezyn/app_cubits/users/single_barber_cubit/single_barber_state.dart';
import 'package:almezyn/screens/barbers/book_appointment_screen.dart';
import 'package:almezyn/screens/salons/single_salon_details_screen.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class SingleBarberDetailsScreen extends StatefulWidget {
  final barberId;
  final salonId;
  final salonName ;
  final salonLat ;
  final salonLolong ;
  SingleBarberDetailsScreen({this.barberId :"", this.salonId :"" , this.salonName:"" , this.salonLat :"", this.salonLolong :""});
  @override
  _SingleBarberDetailsScreenState createState() =>
   _SingleBarberDetailsScreenState(barberId, salonId , salonName , salonLat , salonLolong );
}
class _SingleBarberDetailsScreenState extends State<SingleBarberDetailsScreen> {
  @override
  final barberId;
  final salonId;
  final salonName ;
  final salonLat ;
  final salonLong ;
  var selectedItemList;
  List<String> _checked = ["A", "B"];
  bool borderColor = false;
  int selected  ;
  int sentToApi ;

  _SingleBarberDetailsScreenState(this.barberId, this.salonId , this.salonName , this.salonLat , this.salonLong);
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
                body: Container(
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * .75,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.network(
                                  "${baseImageUrl}${cubit.singleBarberMap["data"]["image"]}",
                                  height: height * .3,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      right: width * .05, left: width * .05),
                                  height: height * .88,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .03),
                                        Row(
                                          children: [
                                            customDescriptionTextText(
                                                context: context,
                                                text: checkDirection(
                                                  cubit.singleBarberMap["data"]
                                                      ["name"],
                                                  cubit.singleBarberMap["data"]
                                                      ["name"],
                                                ),
                                                maxLines: 10,
                                                textAlign: TextAlign.start,
                                                percentageOfHeight: .03,
                                                fontWeight: FontWeight.bold,
                                                textColor: Colors.black),
                                          ],
                                        ),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),
                                        Row(
                                          children: [
                                            customDescriptionTextText(
                                                context: context,
                                                text: checkDirection(
                                                  cubit.singleBarberMap["data"]
                                                  ["name"],
                                                  cubit.singleBarberMap["data"]
                                                  ["name"],
                                                ),
                                                maxLines: 10,
                                                textAlign: TextAlign.start,
                                                percentageOfHeight: .03,
                                                fontWeight: FontWeight.bold,
                                                textColor: Colors.black),
                                          ],
                                        ),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),
                                        Row(
                                          children: [
                                            GestureDetector(child: customDescriptionTextText(
                                                context: context,
                                                text: translator
                                                    .translate(salonName),
                                                maxLines: 10,
                                                textAlign: TextAlign.start,
                                                percentageOfHeight: .03,
                                                fontWeight: FontWeight.bold,
                                                textColor: blueColor),onTap: (){
                                              customAnimatedPushNavigation(context,
                                                  SingleSalonDetailsScreen(salonId: salonId , salonLat: salonLat,salonLong: salonLong,));
                                            },)
                                          ],
                                        ),
                                        Container(
                                          height: height * .2,
                                          child: ListView.builder(
//                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: cubit
                                                  .singleBarberMap["data"]
                                                      ["services"]
                                                  .length,
                                              itemBuilder: (context, subIndex) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          isLandscape(context)
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(
                                                                        "${baseImageUrl}${cubit.singleBarberMap["data"]["services"][subIndex]["image"]}"),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  color:
                                                                      backGroundColor,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              0)),
                                                                ),
                                                                height: isLandscape(
                                                                        context)
                                                                    ? 2 *
                                                                        height *
                                                                        .1
                                                                    : height *
                                                                        .1,
                                                                width:
                                                                    width * .2,
                                                              ),
                                                              Container(
                                                                  child:
                                                                      Container(
                                                                width:
                                                                    width * .68,
                                                                height: isLandscape(
                                                                        context)
                                                                    ? 2 *
                                                                        height *
                                                                        .1
                                                                    : height *
                                                                        .1,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0)),
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width:
                                                                          width *
                                                                              .03,
                                                                    ),
                                                                    Container(
                                                                        child: customDescriptionTextText(
                                                                            textColor: blackColor,
                                                                            fontWeight: FontWeight.bold,
                                                                            context: context,
                                                                            textAlign: TextAlign.start,
                                                                            text: checkDirection(
                                                                              cubit.singleBarberMap["data"]["services"][subIndex]["name_ar"],
                                                                              cubit.singleBarberMap["data"]["services"][subIndex]["name_en"],
                                                                            ))),
                                                                  ],
                                                                ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),
                                        Row(
                                          children: [
                                            customDescriptionTextText(
                                                context: context,
                                                text: translator.translate(
                                                    "Available Times:"),
                                                maxLines: 10,
                                                textAlign: TextAlign.start,
                                                percentageOfHeight: .03,
                                                fontWeight: FontWeight.bold,
                                                textColor: Colors.black),
                                          ],
                                        ),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),

                                        Container(
                                          height: height * .3,
                                          child: ListView.builder(
//                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: cubit
                                                  .singleBarberMap["data"]
                                              ["availability"]
                                                  .length,
                                              itemBuilder: (context, subIndex) {
                                                return Column(
                                                  children: [
                                                    responsiveSizedBox(
                                                        context: context,
                                                        percentageOfHeight:
                                                        .03),
                                                    Neumorphic(
                                                      child: Container(
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
                                                                    text: cubit.singleBarberMap["data"]["availability"][subIndex]["date"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][subIndex]
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
                                                                    text: cubit.singleBarberMap["data"]["availability"][subIndex]["day"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][subIndex]
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
                                                                    text: cubit.singleBarberMap["data"]["availability"][subIndex]["start_time"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][subIndex]
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
                                                                    text: cubit.singleBarberMap["data"]["availability"][subIndex]["end_date"] ==
                                                                        null
                                                                        ? ""
                                                                        : cubit.singleBarberMap["data"]["availability"][subIndex]
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
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),
//                                        Row(
//                                          children: [
//                                            customDescriptionTextText(
//                                                context: context,
//                                                text: translator
//                                                    .translate("Reviews:"),
//                                                maxLines: 10,
//                                                textAlign: TextAlign.start,
//                                                percentageOfHeight: .03,
//                                                fontWeight: FontWeight.bold,
//                                                textColor: Colors.black),
//                                          ],
//                                        ),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),
//                                        Container(
//                                          height: height * .3,
//                                          child: ListView.builder(
////                                              shrinkWrap: true,
//                                              physics: BouncingScrollPhysics(),
//                                              scrollDirection: Axis.vertical,
//                                              itemCount: cubit
//                                                  .singleBarberMap["data"]
//                                              ["ratings"]
//                                                  .length,
//                                              itemBuilder: (context, subIndex) {
//                                                return Container(
//                                                  margin: EdgeInsets.only(
//                                                      bottom:
//                                                          isLandscape(context)
//                                                              ? 2 * height * .03
//                                                              : height * .03),
//                                                  child: Row(
//                                                    children: [
//                                                      Container(
//                                                        child: Container(
//                                                          width: width * .88,
//                                                          child: Row(
//                                                            children: [
//                                                              Column(
//                                                                mainAxisAlignment:
//                                                                    MainAxisAlignment
//                                                                        .center,
//                                                                children: [
//                                                                  Container(
//                                                                    decoration:
//                                                                        BoxDecoration(
//                                                                      shape: BoxShape
//                                                                          .circle,
//                                                                      image:
//                                                                          DecorationImage(
//                                                                        image: NetworkImage(
//                                                                            "https://st2.depositphotos.com/1011434/5480/i/950/depositphotos_54809905-stock-photo-smiling-guy.jpg"),
//                                                                        fit: BoxFit
//                                                                            .cover,
//                                                                      ),
//                                                                      color:
//                                                                          backGroundColor,
//                                                                    ),
//                                                                    height: isLandscape(
//                                                                            context)
//                                                                        ? 2 *
//                                                                            height *
//                                                                            .08
//                                                                        : height *
//                                                                            .08,
//                                                                    width:
//                                                                        width *
//                                                                            .15,
//                                                                  ),
//                                                                ],
//                                                              ),
//                                                              SizedBox(
//                                                                width:
//                                                                    width * .02,
//                                                              ),
//                                                              Column(
//                                                                mainAxisAlignment:
//                                                                    MainAxisAlignment
//                                                                        .center,
//                                                                children: [
//                                                                  Container(
//                                                                      child:
//                                                                          Container(
//                                                                    width:
//                                                                        width *
//                                                                            .68,
//                                                                    decoration: BoxDecoration(
//                                                                        borderRadius:
//                                                                            BorderRadius.circular(0)),
//                                                                    child:
//                                                                        Column(
//                                                                      crossAxisAlignment:
//                                                                          CrossAxisAlignment
//                                                                              .start,
//                                                                      children: [
//                                                                        Row(
//                                                                          mainAxisAlignment:
//                                                                              MainAxisAlignment.spaceBetween,
//                                                                          children: [
//                                                                            Container(
//                                                                                width: width * .4,
//                                                                                child: customDescriptionTextText(context: context, fontWeight: FontWeight.bold, textColor: blackColor, textAlign: TextAlign.start, text: checkDirection("على عمرو", "Ali Amr"))),
//                                                                            Row(
//                                                                              children: [
//                                                                                Container(
//                                                                                    child: Icon(
//                                                                                  Icons.star,
//                                                                                  color: yellowColor,
//                                                                                  size: isLandscape(context) ? 2 * height * .02 : height * .02,
//                                                                                )),
//                                                                                customDescriptionTextText(context: context, textColor: blueColor, fontWeight: FontWeight.bold, textAlign: TextAlign.start, text: checkDirection("5.0", "5.0"))
//                                                                              ],
//                                                                            ),
//                                                                          ],
//                                                                        ),
//                                                                        Row(
//                                                                          mainAxisAlignment:
//                                                                              MainAxisAlignment.start,
//                                                                          children: [
//                                                                            Container(
//                                                                                width: width * .6,
//                                                                                child: customDescriptionTextText(context: context, maxLines: 3, textAlign: TextAlign.start, text: checkDirection("هو حلاق متميز ومتقن في عمله ... شكرا لك ", "He is a good barber , thanks "))),
//                                                                          ],
//                                                                        ),
//                                                                      ],
//                                                                    ),
//                                                                  )),
//                                                                ],
//                                                              ),
//                                                            ],
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  ),
//                                                );
//                                              }),
//                                        ),
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .02),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .05),
                        CustomButton(
                          text: "Book Appointment with",
                          onTapButton: () {
//                            showBottomSheetMenuForAddingCard(context: context , onTapAddCardButton: (){});
                            customPushNamedNavigation(
                                context,
                                BookAppointmentScreen(
                                    barberId: cubit.singleBarberMap["data"]
                                            ["id"]
                                        .toString(),
                                    salonId: salonId.toString()));
                          },
                        ) ,
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .02),
                        CustomButton( buttonColor: greyColor,
                          text: "Save Barber",
                          onTapButton: () {
//                            showBottomSheetMenuForAddingCard(context: context , onTapAddCardButton: (){});
                          _onTapSaveBarber(cubit.singleBarberMap["data"]["id"].toString());
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


  _onTapSaveBarber( id ){
    print(
        "save salon tapped ");

    DioHelper.postData(
      url: "/store-save",
      data: {
        "type":"barber",
        "item_id": id
      },
      token: token,
    ).then((value) {
      final response =
          value.data;
      print(
          "response for address is   ${response}");
      print(
          "status code for adding address is   ${value.statusCode}");
      ScaffoldMessenger.of(
          context)
          .showSnackBar(
          SnackBar(
            content: Text(value.data["message"]),
            padding: EdgeInsets.only(bottom: 40),
          ));
    });
  }

  void showBottomSheetMenuForAddingCard(
      {BuildContext context, onTapAddCardButton}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: height(context),
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            responsiveSizedBox(
                                context: context, percentageOfHeight: .02),
                            customDescriptionTextText(
                                context: context,
                                textColor: blackColor,
                                text: "Book Appointment ",
                                percentageOfHeight: .025,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: width(context) * .05,
                              left: width(context) * .05),
                          child: Column(
                            children: [
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .02),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .02),
                              Row(
                                children: [
                                  customDescriptionTextText(
                                      context: context,
                                      text: "Choose a service :",
                                      percentageOfHeight: .025,
                                      textAlign: TextAlign.start,
                                      textColor: blackColor),
                                ],
                              ),


                              Container(height: height(context)*.5,child:
                              ListView.builder(
//                                              shrinkWrap: true,
                                  physics:
                                  BouncingScrollPhysics(),
                                  scrollDirection:
                                  Axis.vertical,
                                  itemCount:10,
                                  itemBuilder:
                                      (context, index ) {
                                    return  Column(
                                      children: [
                                        responsiveSizedBox(context: context , percentageOfHeight: .05),
                                        GestureDetector(onTap: (){
                                          setState(() {
                                            borderColor =!borderColor ;
                                            print(index + 1);
                                            selected = (index) ;
                                            print("selected is ${selected} and index is ${index}");
                                            sentToApi = (index + 1) ;
                                            print("sent to api is ${sentToApi}") ;});

                                        },
                                          child: Container(height: height(context)*.1,
                                              alignment: Alignment.center,
                                              width: width(context)*.9,
                                              decoration:
                                              BoxDecoration(border: Border.all(color: selected == index ? blueColor : greyColor, width: 2)),
                                              child: customDescriptionTextText(
                                                  textColor: blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  context:
                                                  context,
                                                  textAlign:
                                                  TextAlign
                                                      .start,
                                                  text:checkDirection("service ${index+1}", 'service ${index+1}')

                                              )),
                                        ),],
                                    );
                                  }),),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .02),
                              Row(
                                children: [
                                  customDescriptionTextText(
                                      context: context,
                                      text: "Choose a speciality :",
                                      percentageOfHeight: .025,
                                      textAlign: TextAlign.start,
                                      textColor: blackColor),
                                ],
                              ),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .02),
                              brandCheckBoxFilter(
                                context: context,
                                onChangeCheckBox: (itemList) {
                                  setState(() {
                                    selectedItemList = itemList;
                                    print('SELECTED ITEM LIST $itemList');
                                  });
                                },
                              ),
                              responsiveSizedBox(
                                  context: context, percentageOfHeight: .02),
                              Row(
                                children: [
                                  customDescriptionTextText(
                                      context: context,
                                      text: "Description :",
                                      percentageOfHeight: .025,
                                      textAlign: TextAlign.start,
                                      textColor: blackColor),
                                ],
                              )
                            ],
                          ),
                        ),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .02),
                        CustomTextField(
                          hint: "appointment for ",
                        ),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .02),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .02),
                        CustomButton(
                            onTapButton: onTapAddCardButton,
                            text: "Confirm Booking"),
                        responsiveSizedBox(
                            context: context, percentageOfHeight: .02),
                      ],
                    ),
                  ),
                )),
          );
        });
  }

  brandCheckBoxFilter({BuildContext context, Function onChangeCheckBox}) {
    List<String> allItemList = [
      'Hair cut ',
      'Beard shaving ',
      'Baby  Hair cut ',
    ];

    List<String> checkedItemList = ['Green', 'Yellow'];

    return GroupedCheckbox(
      hoverColor: blueColor,
      itemList: allItemList,
//      checkedItemList: checkedItemList,
//      disabled: ['Black'],
      onChanged: onChangeCheckBox,
//          (itemList) {
//        setState(() {
//          selectedItemList = itemList;
//          print('SELECTED ITEM LIST $itemList');
//        });
//      },
      orientation: CheckboxOrientation.VERTICAL,
      checkColor: whiteColor,
      activeColor: blueColor,
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

