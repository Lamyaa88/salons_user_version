//import 'dart:async';
//import 'dart:collection';
//import 'package:almezyn/Models/salons_models/single_salon_model.dart';
//import 'package:almezyn/screens/salons/widgets/top_slider.dart';
//import 'package:flutter/services.dart';
//import 'package:geocoder/geocoder.dart';
//import 'package:almezyn/utils/check_direction.dart';
//import 'package:almezyn/utils/constants.dart';
//import 'package:almezyn/utils/file_export.dart';
//import 'package:almezyn/screens/more/widgets/user_data.dart';
//import 'package:almezyn/screens/salons/widgets/single_tap_button.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:geocoding/geocoding.dart';
////import 'package:geolocator/geolocator.dart';
//import 'package:almezyn/screens/barbers/single_barber_details.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:almezyn/app_cubits/salon/single_salon_cubit/single_salon_state.dart';
//import 'package:almezyn/app_cubits/salon/single_salon_cubit/single_salon_cubit.dart';
//import 'package:almezyn/screens/salons/single_salon_location_screen.dart';
//import 'package:localize_and_translate/localize_and_translate.dart';
//
//class SingleSalonDetailsScreen2 extends StatefulWidget {
//  final salonId;
//  SingleSalonDetailsScreen2({this.salonId});
//  @override
//  _SingleSalonDetailsScreen2State createState() =>
//      _SingleSalonDetailsScreen2State(salonId);
//}
//
//class _SingleSalonDetailsScreen2State extends State<SingleSalonDetailsScreen2> {
//  @override
//  void initState() {
//    DioHelper.getAllData(url: "/salon/${salonId}", token: token)
//        .then((value) async {
//      singleSalonModel = SingleSalonModel.fromJson(value.data);
//      setState(() {
//        locationLat = double.parse(singleSalonModel.data.location[0].lat);
//        locationLong = double.parse(singleSalonModel.data.location[0].lng);
//        print("slon lat is ${locationLat}");
//      });
//    });
//
////    ---------------------- location
//    getLocation();
//  }
//
//  getLocation() async {
//    placeMarks = await placemarkFromCoordinates(locationLat, locationLong);
//    print(placeMarks[0].street);
//    setState(() {
//      salonStreet = placeMarks[0].street;
//    });
//  }
//
//  List<Placemark> placeMarks = [];
//  String salonStreet = "";
//  final salonId;
//  double locationLat = 20.43455;
//  double locationLong = 50.333333;
//  SingleSalonModel singleSalonModel;
//  _SingleSalonDetailsScreen2State(this.salonId);
//
//  bool firstActive = true;
//  bool secondActive = false;
//  bool thirdActive = false;
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    return Container(
//      color: whiteColor,
//      child: BlocProvider(
//        create: (BuildContext context) =>
//            SingleSalonCubit()..getSingleSalon(id: salonId),
//        child: BlocConsumer<SingleSalonCubit, SingleSalonStates>(
//          listener: (context, state) => {},
//          builder: (context, state) {
//            var cubit = SingleSalonCubit.get(context);
//            if (state is! SingleSalonLoadingState) {
//              return Scaffold(
//                backgroundColor: whiteColor,
//                body: Container(
//                  child: cubit.statusCode == 200
//                      ? CustomBuildBody(
//                          backNotDrawerIcon: true,
//                          isWithoutLogo: true,
//                          headerText: checkDirection(
//                              cubit.singleSalonModel.data.nameAr,
//                              cubit.singleSalonModel.data.nameEn),
//                          paddingPercentageForBody: 0.0,
//                          columnOfWidgets: Column(
//                            children: [
//                              Container(
//                                height: height,
//                                child: NestedScrollView(
//                                    headerSliverBuilder: (BuildContext context,
//                                        bool innerBoxIsScrolled) {
//                                      return <Widget>[
//                                        SliverAppBar(
//                                          automaticallyImplyLeading: false,
//                                          leading: null,
//                                          expandedHeight: isLandscape(context)
//                                              ? 2 * height * .26
//                                              : height * .26,
//                                          backgroundColor: whiteColor,
//                                          floating: false,
//                                          pinned: false,
//                                          flexibleSpace: FlexibleSpaceBar(
//                                              background: Container(
//                                           child:
//                                            Column(
//                                              children: [
//                                                Container(
//                                                    height: height * .26,
//                                                    width: width,
//                                                    decoration: BoxDecoration(
//                                                        borderRadius:
//                                                            BorderRadius
//                                                                .circular(8),
//                                                        image: DecorationImage(
//                                                            image: NetworkImage(
//                                                              cubit.singleSalonModel.data
//                                                                              .images[
//                                                                          0] ==
//                                                                      null
//                                                                  ? "https://www.historicconsultants.com/wp-content/uploads/placeholder3.png"
//                                                                  : "$baseImageUrl${cubit.singleSalonModel.data.images[0]}",
//                                                            ),
//                                                            fit: BoxFit.fill)))
//                                              ],
//                                            ),
//                                          )),
//                                        ),
//                                      ];
//                                    },
//                                    body: Container(
//                                      color: backGroundColor,
//                                      padding: EdgeInsets.only(
//                                          right: width * .05,
//                                          left: width * .05),
//                                      child: SingleChildScrollView(
//                                        child: Column(
//                                          children: [
//                                            responsiveSizedBox(
//                                                context: context,
//                                                percentageOfHeight: .01),
//                                            Container(
//
//                                              width: width,
//                                              child: Row(
//                                                mainAxisAlignment:
//                                                    MainAxisAlignment
//                                                        .spaceBetween,
//                                                children: [
//                                                  singleTabButton(
//                                                      context: context,
//                                                      buttonText: "Salon Info ",
//                                                      onTapButton: () {
//                                                        setState(() {
//                                                          firstActive = true;
//                                                          secondActive = false;
//                                                          thirdActive = false;
//                                                        });
//                                                      },
//                                                      isThisButtonActive:
//                                                          firstActive),
//                                                  singleTabButton(
//                                                      context: context,
//                                                      buttonText: "Barbers",
//                                                      onTapButton: () {
//                                                        setState(() {
//                                                          firstActive = false;
//                                                          secondActive = true;
//                                                          thirdActive = false;
//                                                        });
//                                                      },
//                                                      isThisButtonActive:
//                                                          secondActive),
//                                                  singleTabButton(
//                                                      context: context,
//                                                      buttonText: "location ",
//                                                      onTapButton: () {
//                                                        setState(() {
//                                                          firstActive = false;
//                                                          secondActive = false;
//                                                          thirdActive = true;
//                                                        });
//                                                      },
//                                                      isThisButtonActive:
//                                                          thirdActive)
//                                                ],
//                                              ),
//                                            ),
//                                            responsiveSizedBox(
//                                                context: context,
//                                                percentageOfHeight: .01),
//                                            Container(
//                                              child: firstActive == true
//                                                  ?
//
////                              ------------------------------------------------------------ tap 1
//                                                  Container(color: whiteColor,
//                                                      child: Center(
//                                                          child:
//                                                              SingleChildScrollView(
//                                                        child: Column(
//                                                          children: [
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                    context,
//                                                                percentageOfHeight:
//                                                                    .02),
//
//                                                            Row(
//                                                              children: [
//                                                                customDescriptionTextText(
//                                                                    context:
//                                                                    context,
//                                                                    text:
//                                                                    checkDirection(
//                                                                        cubit
//                                                                            .singleSalonModel
//                                                                            .data
//                                                                            .nameAr,
//                                                                        cubit
//                                                                            .singleSalonModel
//                                                                            .data
//                                                                            .nameEn),
//                                                                    maxLines:
//                                                                    10,
//                                                                    textAlign:
//                                                                    TextAlign
//                                                                        .start,
//                                                                    percentageOfHeight:
//                                                                    .025,
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .bold,
//                                                                    textColor:
//                                                                    Colors
//                                                                        .black),
//                                                              ],
//                                                            ),
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                context,
//                                                                percentageOfHeight:
//                                                                .02),
//                                                            Row(
//                                                              children: [
//                                                                Container(
//                                                                  width: width *
//                                                                      .9,
//                                                                  child: customDescriptionTextText(
//                                                                      context:
//                                                                          context,
//                                                                      text: checkDirection(
//                                                                          cubit
//                                                                              .singleSalonModel
//                                                                              .data
//                                                                              .descriptionAr,
//                                                                          cubit
//                                                                              .singleSalonModel
//                                                                              .data
//                                                                              .descriptionAr),
//                                                                      maxLines:
//                                                                          5,
//                                                                      textAlign:
//                                                                          TextAlign
//                                                                              .start,
//                                                                      textColor:
//                                                                          textColor,
//                                                                      percentageOfHeight:
//                                                                          .025),
//                                                                )
//                                                              ],
//                                                            ),
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                    context,
//                                                                percentageOfHeight:
//                                                                    .02),
//                                                            Container(color: backGroundColor,height: height*.05,width: width,),
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                    context,
//                                                                percentageOfHeight:
//                                                                    .02),
//                                                            Row(
//                                                              children: [
//                                                                customDescriptionTextText(
//                                                                    context:
//                                                                        context,
//                                                                    text:
//                                                                        "Address",
//                                                                    maxLines:
//                                                                        10,
//                                                                    textAlign:
//                                                                        TextAlign
//                                                                            .start,
//                                                                    percentageOfHeight:
//                                                                        .025,
//                                                                    fontWeight:
//                                                                        FontWeight
//                                                                            .bold,
//                                                                    textColor:
//                                                                        Colors
//                                                                            .black),
//                                                              ],
//                                                            ),
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                    context,
//                                                                percentageOfHeight:
//                                                                    .02),
//                                                            Row(
//                                                              children: [
//                                                                Container(
//                                                                  width: width *
//                                                                      .9,
//                                                                  child: customDescriptionTextText(
//                                                                      context:
//                                                                          context,
//                                                                      text:
//                                                                          salonStreet,
//                                                                      maxLines:
//                                                                          3,
//                                                                      textAlign:
//                                                                          TextAlign
//                                                                              .start,
//                                                                      textColor:
//                                                                          textColor,
//                                                                      percentageOfHeight:
//                                                                          .025),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                    context,
//                                                                percentageOfHeight:
//                                                                    .02),
//                                                         Container(color: backGroundColor,height: height*.05,width: width,),
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                    context,
//                                                                percentageOfHeight:
//                                                                    .02),
//                                                            Row(
//                                                              children: [
//                                                                customDescriptionTextText(
//                                                                    context:
//                                                                        context,
//                                                                    textColor:
//                                                                        blackColor,
//                                                                    text:
//                                                                        "Services",
//                                                                    percentageOfHeight:
//                                                                        .025,
//                                                                    fontWeight:
//                                                                        FontWeight
//                                                                            .bold)
//                                                              ],
//                                                            ),
//                                                            responsiveSizedBox(
//                                                                context:
//                                                                    context,
//                                                                percentageOfHeight:
//                                                                    .02),
//                                                            Container(
//                                                              width: width * .9,
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                    MainAxisAlignment
//                                                                        .start,
//                                                                children: [
//                                                                  Container(
//                                                                      width:
//                                                                          width *
//                                                                              .9,
//                                                                      height: isLandscape(
//                                                                              context)
//                                                                          ? 2 *
//                                                                              height *
//                                                                              .3
//                                                                          : height *
//                                                                              .3,
//                                                                      child: ListView.builder(
////                                          shrinkWrap: true,
////                                        physics: BouncingScrollPhysics(),
////                                              scrollDirection: Axis.vertical,
//                                                                          itemCount: cubit.singleSalonModel.data.specialities.length,
//                                                                          itemBuilder: (context, indexForServices) {
//                                                                            return Row(
//                                                                              children: [
//                                                                                Container(height: height*.06,
//                                                                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                                                                                    children: [
//                                                                                      Container(
//                                                                                        height: height * .05,
//                                                                                        width: width * .12,
//                                                                                        decoration: BoxDecoration(
//                                                                                            borderRadius: BorderRadius.circular(8),
//                                                                                            image: DecorationImage(
//                                                                                                image: NetworkImage(
//                                                                                                  cubit.singleSalonModel.data.specialities[indexForServices].image == null ? "https://www.historicconsultants.com/wp-content/uploads/placeholder3.png" : "$baseImageUrl${cubit.singleSalonModel.data.specialities[indexForServices].image}",
//                                                                                                ),
//                                                                                                fit: BoxFit.fill)),
//                                                                                      ),
//                                                                                    ],
//                                                                                  ),
//                                                                                ),
//                                                                                SizedBox(
//                                                                                  width: width * .03,
//                                                                                ),
//                                                                                Container(height: height*.06,
//                                                                                  child: Center(
//                                                                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                                                                                      children: [
//                                                                                        Container(margin: EdgeInsets.only(bottom: 10), width: width * .7, child: customDescriptionTextText(context: context, text: checkDirection(cubit.singleSalonModel.data.specialities[indexForServices].nameAr, cubit.singleSalonModel.data.specialities[indexForServices].nameEn), textAlign: TextAlign.start, percentageOfHeight: .022)),
//                                                                                      ],
//                                                                                    ),
//                                                                                  ),
//                                                                                ),
//                                                                              ],
//                                                                            );
//                                                                          })),
//                                                                ],
//                                                              ),
//                                                            ),
//                                                          ],
//                                                        ),
//                                                      )),
//                                                    )
//                                                  :
////                          ------------------------------------------------------------------ tap 2
//
//                                                  Container(
//                                                      child: secondActive ==
//                                                              true
//                                                          ? Container(
//                                                              child: Center(
//                                                                child: Row(
//                                                                  mainAxisAlignment:
//                                                                      MainAxisAlignment
//                                                                          .start,
//                                                                  children: [
//                                                                    Container(
//                                                                        width: width *
//                                                                            .9,
//                                                                        height: isLandscape(context)
//                                                                            ? 2 *
//                                                                                height *
//                                                                                .75
//                                                                            : height *
//                                                                                .75,
//                                                                        child: ListView.builder(
////                                          shrinkWrap: true,
////                                        physics: BouncingScrollPhysics(),
////                                              scrollDirection: Axis.vertical,
//                                                                            itemCount: cubit.singleSalonModel.data.barbers.length ,
//                                                                            itemBuilder: (context, indexForBarbers) {
//                                                                              return Container(
//                                                                                child: Row(
//                                                                                  mainAxisAlignment: MainAxisAlignment.center,
//                                                                                  children: [
//                                                                                    GestureDetector(
//                                                                                      onTap: () {
//                                                                                        customAnimatedPushNavigation(context,
//                                                                                            SingleBarberDetailsScreen(barberId: cubit.singleSalonModel.data.barbers[indexForBarbers].id.toString(),));
//                                                                                      },
//                                                                                      child: Container(
//
//                                                                                        margin: EdgeInsets.only(
//                                                                                          bottom: isLandscape(context) ? 2 * height * .02 : height * .02,
//                                                                                        ),
//                                                                                        height: isLandscape(context) ? 2 * height * .2 : height * .2,
//                                                                                        child: Container(color: whiteColor,
//                                                                                          child: Row(
//                                                                                            mainAxisAlignment: MainAxisAlignment.start,
//                                                                                            children: [
//                                                                                              Column(
//                                                                                                mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                children: [
//                                                                                                  Container(
//                                                                                                    height: isLandscape(context) ? 2 * height * .15 : height * .15,
//                                                                                                    width: width * .26,
//                                                                                                    decoration: BoxDecoration(
//                                                                                                        borderRadius: BorderRadius.circular(8),
//                                                                                                        image: DecorationImage(
//                                                                                                            image: NetworkImage(
//                                                                                                              cubit.singleSalonModel.data
//                                                                                                                  .images[
//                                                                                                              0] ==
//                                                                                                                  null
//                                                                                                                  ? "https://www.historicconsultants.com/wp-content/uploads/placeholder3.png"
//                                                                                                                  : "$baseImageUrl${cubit.singleSalonModel.data.barbers[indexForBarbers].image}",
//                                                                                                            ),
//                                                                                                            fit: BoxFit.fill)),
//                                                                                                  ),
//                                                                                                ],
//                                                                                              ),
//                                                                                              SizedBox(
//                                                                                                width: width * .04,
//                                                                                              ),
//                                                                                              Container(
//                                                                                                width: width * .6,
//                                                                                                child: Column(
//                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                                  children: [
//                                                                                                    customDescriptionTextText(context: context, text: checkDirection(cubit.singleSalonModel.data.barbers[indexForBarbers].name, cubit.singleSalonModel.data.barbers[indexForBarbers].name), percentageOfHeight: .028, textColor: blackColor, textAlign: TextAlign.start, fontWeight: FontWeight.bold),
//                                                                                                    responsiveSizedBox(context: context, percentageOfHeight: .01),
//                                                                                                    Container(
//                                                                                                        width: width * .5,
//                                                                                                        height: height * .05,
//                                                                                                        child: ListView.builder(
//                                                                                                            scrollDirection: Axis.horizontal,
//                                                                                                            itemCount: cubit.singleSalonModel.data.specialities.length,
//                                                                                                            itemBuilder: (context, indexOfspecifications) {
//                                                                                                              return Row(
//                                                                                                                children: [
//                                                                                                                  SizedBox(
//                                                                                                                    width: width * .03,
//                                                                                                                  ),
//                                                                                                                  Container(
//                                                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: blueColor.withOpacity(.2)),
//                                                                                                                    width: width * .25,
//                                                                                                                    height: height * .04,
//                                                                                                                    child: Center(
//                                                                                                                      child: customDescriptionTextText(context: context,textColor: whiteColor, text: checkDirection(cubit.singleSalonModel.data.specialities[indexOfspecifications].nameAr, cubit.singleSalonModel.data.specialities[indexOfspecifications].nameEn), percentageOfHeight: .02),
//                                                                                                                    ),
//                                                                                                                  ),
//                                                                                                                ],
//                                                                                                              );
//                                                                                                            })),
//                                                                                                    responsiveSizedBox(context: context, percentageOfHeight: .01),
//                                                                                                    Row(
//                                                                                                      children: [
//                                                                                                        SizedBox(
//                                                                                                          width: width * .02,
//                                                                                                        ),
//                                                                                                        Icon(
//                                                                                                          Icons.star,
//                                                                                                          size: 15,
//                                                                                                          color: yellowColor,
//                                                                                                        ),
//                                                                                                        customDescriptionTextText(
//                                                                                                          context: context,
//                                                                                                          text: "5.0",
//                                                                                                          percentageOfHeight: .02,
//                                                                                                          textAlign: TextAlign.start,
//                                                                                                        ),
//                                                                                                        SizedBox(
//                                                                                                          width: width * .2,
//                                                                                                        ),
//                                                                                                        Row(
//                                                                                                          children: [
//                                                                                                            customDescriptionTextText(context: context, text: "Fees", percentageOfHeight: .02, textAlign: TextAlign.start, fontWeight: FontWeight.bold, textColor: blueColor),
//                                                                                                            SizedBox(
//                                                                                                              width: width * .02,
//                                                                                                            ),
//                                                                                                            customDescriptionTextText(
//                                                                                                              context: context,
//                                                                                                              text: "\$ 55",
//                                                                                                              percentageOfHeight: .02,
//                                                                                                              textAlign: TextAlign.start,
//                                                                                                            ),
//                                                                                                          ],
//                                                                                                        )
//                                                                                                      ],
//                                                                                                    )
//                                                                                                  ],
//                                                                                                ),
//                                                                                              )
//                                                                                            ],
//                                                                                          ),
//                                                                                        ),
//                                                                                      ),
//                                                                                    ),
//                                                                                  ],
//                                                                                ),
//                                                                              );
//                                                                            })),
//                                                                  ],
//
//                                                                  //                            ------------------------------------------------------------------- tap 3
//                                                                ),
//                                                              ),
//                                                            )
//                                                          : Container(
//                                                              width: width * .9,
//                                                              height:
//                                                                  height * .75,
//                                                              child:
//                                                                  map(context),
//                                                            ),
//                                                    ),
//                                            )
//                                          ],
//                                        ),
//                                      ),
//                                    )),
//                              ),
//                            ],
//                          ),
//                          onTapNotifications: () {
//                            print("notifications  icon pressed ");
//                          },
//                        )
//                      : Container(
//                          color: Colors.white,
//                          child: Center(
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                Image.asset(AppImages.no_internet2),
//                                customDescriptionTextText(
//                                    context: context,
//                                    text: translator.translate("No_Internet"))
//                              ],
//                            ),
//                          )),
//                ),
//              );
//            }
//            return Center(
//              child: spinKit,
//            );
//          },
//        ),
//      ),
//    );
//  }
//
//  Widget map(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: [
//        Container(
//          width: width * .9,
//          height: height * .7,
//          child: GoogleMap(
//            onMapCreated: _onMapCreated,
//            markers: markers,
////            circles: circles,
//            initialCameraPosition: CameraPosition(
//              target: LatLng(locationLat, locationLong),
//              zoom: 11.0,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
////  -----
////------
////------
////------
////  -------------------------------------------------------------------- all  google  maps functions and variables  here (start)
//
//// first _  controller
//  Completer<GoogleMapController> _controller = Completer();
////  static const LatLng _center =
////  const LatLng(locationLat , locationLong );
//
//// second _ on map created
//  void _onMapCreated(GoogleMapController controller) {
//    _controller.complete(controller);
//    setState(() {
//      markers.add(
//        Marker(
//            onTap: () {
//              customAnimatedPushNavigation(context,
//                  SingleSalonLocationScreen(locationLat, locationLong));
//            },
//            markerId: MarkerId("1"),
//            position: LatLng(locationLat, locationLong),
//            infoWindow: InfoWindow(
//              title: "salon name ",
//            )),
//      );
//    });
//  }
//
//// third _  markers
//  var markers = HashSet<Marker>();
//  BitmapDescriptor customMarkerImage;
//  getCustomMarker() async {
//    customMarkerImage = await BitmapDescriptor.fromAssetImage(
//      ImageConfiguration.empty,
//      'assets/images/cart.png',
//    );
//  }
//
////   finally _  circles
//  Set<Circle> circles = Set.from([
//    Circle(
//        circleId: CircleId("1"),
//        center: LatLng(24.723201041398024, 46.67196272469909),
//        radius: 5000,
//        fillColor: Colors.grey.withOpacity(.4),
//        strokeWidth: 0,
//        visible: true)
//  ]);
////  -------------------------------------------------------------------- (end of google maps functions part )
//}
