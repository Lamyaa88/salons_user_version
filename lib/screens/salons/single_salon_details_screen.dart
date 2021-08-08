import 'dart:async';
import 'dart:collection';
import 'package:almezyn/app_cubits/salon/single_salon_cubit/single_salon_cubit.dart';
import 'package:almezyn/app_cubits/salon/single_salon_cubit/single_salon_state.dart';
import 'package:almezyn/screens/barbers/single_barber_details.dart';
import 'package:almezyn/screens/salons/single_salon_location_screen.dart';
import 'package:almezyn/screens/salons/widgets/salon_details_first_tap.dart';
import 'package:almezyn/screens/salons/widgets/tab_bar_for_single_salon_details.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class SingleSalonDetailsScreen extends StatefulWidget {
  final String salonId ;
  final double salonLat ;
  final double salonLong ;
  SingleSalonDetailsScreen({this.salonId , this.salonLat , this.salonLong});
  @override
  _SingleSalonDetailsScreenState createState() => _SingleSalonDetailsScreenState(salonId , salonLat , salonLong);
}
class _SingleSalonDetailsScreenState extends State<SingleSalonDetailsScreen> {
  final String salonId ;
  final double salonLat ;
  final double salonLong ;
  _SingleSalonDetailsScreenState(this.salonId , this.salonLat , this.salonLong );

  List<Placemark> placeMarks = [];
  String userPickedLocation = "";
  @override
  void initState() {
//    DioHelper.getAllData(
//      url: "/salon/${salonId}",
//      token: token,
//    ).then((value) {
//          value.data;
//      if(value.statusCode == 200 ){
//        setState(() {
//          salonLat = double.parse(value.data["data"]["location"][0]["lat"]);
//          salonLong = double.parse(value.data["data"]["location"][0]["lng"]);
//          print(" salon cordinates is ${salonLat} , ${salonLong}");
//          print("salonlat type is ${salonLat.runtimeType}");
//        }
//          );}});
    getSalonAddress(salonLat,salonLong) ;
    super.initState();
  }
  getSalonAddress(double pickedLat , double pickedLong) async {
    placeMarks = await placemarkFromCoordinates(pickedLat ,pickedLong);
    print(placeMarks[0].street);
    setState(() {
      userPickedLocation  = "name: ${placeMarks[0].name} \n Street : ${placeMarks[0].street}"
          " \n  subAdministrativeArea :${placeMarks[0].subAdministrativeArea} "
          "\n  administrativeArea : ${placeMarks[0].administrativeArea}  "
          "\n country :${placeMarks[0].country} ";
      print("lcation is ${userPickedLocation}") ;});
      }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(height: height,width: width,
      child: BlocProvider(
          create: (BuildContext context) =>
          SingleSalonCubit()..getSingleSalon(id: salonId),
          child: ListView(
//                    physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(height: height,width: width,color: whiteColor,
                child:
                BlocConsumer<SingleSalonCubit, SingleSalonStates>(
                  listener: (context, state) => {},
                  builder: (context, state) {
                    var cubit = SingleSalonCubit.get(context);
                    if (state is! SingleSalonLoadingState) {
                      return  Scaffold(
                        body: Container(
                            height: height,
                            child: DefaultTabController(
                              length: 3,
                              child: Container(
                                child:
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      responsiveSizedBox(context: context, percentageOfHeight: .05) ,
                                      tapBarForSingleSalonDetails(context : context),
                                      Container(width: width,height: height*.85,
                                        child: TabBarView(
                                          children: [
                                            salonDetailsFirsTap(context : context ,
                                              imagePath: cubit.singleSalonModel.data.images ,
                                              arabicSalonName:cubit.singleSalonModel.data.nameAr,
                                              englishSalonName:cubit.singleSalonModel.data.nameEn,
                                              arabicSalonAddress: userPickedLocation,
                                              englishSalonAddress: userPickedLocation,
                                              arabicSalonDescription: cubit.singleSalonModel.data.descriptionAr ,
                                              englishSalonDescription: cubit.singleSalonModel.data.descriptionEn ,
                                              servicesList: cubit.singleSalonModel.data.specialities ,
                                              onTapAddToSavedList:()
                                          {
                                            _onTapSaveSalon(cubit.singleSalonModel.data.id);
                                          }) ,
//                                            ------------------------------------------------------------------------- second

                                            SingleChildScrollView(
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
                                                        itemCount: cubit.singleSalonModel.data.barbers.length ,

                                                        scrollDirection: Axis.vertical,
                                                        itemBuilder: (context, index) {
                                                          return customSingleBarberCardCard(
                                                            specificationList:
                                                            cubit.singleSalonModel.data.barbers[index].specifications,
                                                              context: context,
                                                              arabicName:  cubit.singleSalonModel.data.barbers[index].name,
                                                              englishName:   cubit.singleSalonModel.data.barbers[index].name ,
                                                              arabicSpecification: "قص الشعر",
                                                              englishSpecification: "Hair Cut",
                                                              specialitiesLength: 10,
                                                              arabicFees: " \$ 50",
                                                              englishFees: " \ 50",
                                                              onTapCard: () {
                                                                customAnimatedPushNavigation(
                                                                    context,
                                                                    SingleBarberDetailsScreen( barberId:
                                                                    cubit.singleSalonModel.data.barbers[index].id.toString(),salonId: cubit.singleSalonModel.data.id.toString(),));
                                                              },
                                                              imagePath:
                                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSqEFTzhbCzNO_A6omZxnhpm0RtNXvjqeXCg&usqp=CAU");
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            )
//                                          ---------------------------------------------------------------------------- secnd
                                           ,
                                            Container(
                                              width: width ,
                                              child:
                                              map(context),
                                            ),
                                          ],
                                        ) ,)

                                    ],
                                  ),
                                ),

                              ),
                            )
                        ),
                      )  ;
                    }
                    return spinKit ;
                  },
                ),
              ),
            ],
          ),
        ),
    ) ;


  }


  _onTapSaveSalon( id ){
    print(
        "save salon tapped ");

    DioHelper.postData(
      url: "/store-save",
      data: {
        "type":"salon",
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
  Widget map(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width ,
          height: height*.9,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: markers,
//            circles: circles,
            initialCameraPosition: CameraPosition(
              target: LatLng(salonLat,salonLong),
              zoom: 11.0,
            ),
          ),
        ),
      ],
    );
  }

  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      markers.add(
        Marker(
            onTap: () {
              customAnimatedPushNavigation(context,
                  SingleSalonLocationScreen(salonLat,salonLong));
            },
            markerId: MarkerId("1"),
            position: LatLng(salonLat,salonLong),
            infoWindow: InfoWindow(
              title: "salon name ",
            )),
      );
    });
  }

  var markers = HashSet<Marker>();

  BitmapDescriptor customMarkerImage;

  getCustomMarker() async {
    customMarkerImage = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/images/cart.png',
    );
  }

  Set<Circle> circles = Set.from([
    Circle(
        circleId: CircleId("1"),
        center: LatLng(29.993522348203385, 31.48447766704748),
        radius: 5000,
        fillColor: Colors.grey.withOpacity(.4),
        strokeWidth: 0,
        visible: true)
  ]);
}


