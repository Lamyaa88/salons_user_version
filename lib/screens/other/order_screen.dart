import 'dart:async';
import 'dart:collection';
import 'package:almezyn/screens/salons/single_salon_location_screen.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/other/payment_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'get_user_current_location_screen.dart';
import 'package:location/location.dart';
class OrderScreen extends StatefulWidget {
  final String location ;
  final double lat ;
  final double long ;
  OrderScreen({this.location ,this.lat , this.long});
  @override

  _OrderScreenState createState() => _OrderScreenState(long : long , lat: lat , location:  location);
}
class _OrderScreenState extends State<OrderScreen> {
  final String location ;
  final double lat ;
  final double long ;
  _OrderScreenState({this.location ,this.lat , this.long});

   double currentLocationLat  =  28.121650833842286 ;
   double   currentLocationLong  = 30.930623376681833  ;
  @override
  void initState() {
    _getCurrentLocation() ;
  }

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
    setState(() {
      currentLocationLat = locData.latitude ;
      currentLocationLong = locData.longitude ;

    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text( translator.translate("Order") ,),
        elevation: 0,
        backgroundColor: whiteColor,
        textTheme: Theme.of(context).textTheme,
        leading:  IconButton(icon:Icon(Icons.arrow_back_ios ,color: blackColor,), onPressed: (){
          Navigator.of(context).pop();
        }),
        centerTitle: true,
      ),
      body:   SingleChildScrollView(
        child: Column(
          children: [

            responsiveSizedBox(context : context , percentageOfHeight: .05),
            Container(width: width(context)*.9,
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [customDescriptionTextText(
                    percentageOfHeight: .022,
                    text:translator.translate("Order Details :") ,
                    textAlign: TextAlign.start,
                    context: context,
                    textColor: blackColor,
                    fontWeight: FontWeight.bold
                ),

                ],),
            ),
            responsiveSizedBox(context : context , percentageOfHeight: .02),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: (){
                  customPushNamedNavigation(context, PickUserLocationScreen(currentLocationLat , currentLocationLong ));
//              showBottomSheetMenuForAddingCard(context: context);
                },
                  child: Neumorphic(
                    child: Container(alignment: checkDirection(Alignment.centerRight, Alignment.centerLeft),padding: EdgeInsets.only(right: width(context)*.02 , left: width(context)*.02),
                        width: width(context)*.9,height: isLandscape(context)
                            ?2* height(context)*.08: height(context)*.08,

                        decoration: BoxDecoration(color: backGroundColor ,
                            borderRadius: BorderRadius.circular(3)),
                        child: customDescriptionTextText(context: context ,maxLines: 2 , textAlign: TextAlign.start,
                            textColor: Color(0xffA0AEC0).withOpacity(.8), text: location == null ? translator.translate("Location") :location , percentageOfHeight: .023)
                    ),
                  ),
                ),
              ],
            ),
            responsiveSizedBox(context : context
                , percentageOfHeight: .02),
            CustomTextField(hint: "Order Recipient Name",),
            responsiveSizedBox(context : context , percentageOfHeight: .02),
            CustomTextField(hint: "Phone Number",),
            responsiveSizedBox(context : context , percentageOfHeight: .02),
            CustomTextField(hint: "Address Details",),
            responsiveSizedBox(context : context , percentageOfHeight: .02),
            CustomButton(text:translator.translate("Continue To Payment"), onTapButton:()
            { customPushNamedNavigation(context, PaymentScreen());},)



          ],
        ),
      ),);
  }



  void showBottomSheetMenuForAddingCard({BuildContext context , onTapAddCardButton}){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return map(context);
        }
    );
  }








  Widget map(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * .9,
          height: height ,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            onTap: (latLng) {
              print('${latLng.latitude}, ${latLng.longitude}');
            },
            markers: markers,
//            circles: circles,
            initialCameraPosition: CameraPosition(
              target: LatLng(30.074468157846702, 31.23644710292137),
              zoom: 11.0,
            ),
          ),
        ),
      ],
    );
  }

//  -----
//------
//------
//------
//  -------------------------------------------------------------------- all  google  maps functions and variables  here (start)

// first _  controller
  Completer<GoogleMapController> _controller = Completer();
//  static const LatLng _center =
//  const LatLng(locationLat , locationLong );

// second _ on map created
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      markers.add(
        Marker(
            onTap: () {
              customAnimatedPushNavigation(context,
                  SingleSalonLocationScreen(30.074468157846702, 31.23644710292137));
            },
            markerId: MarkerId("1"),
            position: LatLng(30.074468157846702, 31.23644710292137),
            infoWindow: InfoWindow(
              title: "salon name ",
            )),
      );
    });
  }

// third _  markers
  var markers = HashSet<Marker>();
  BitmapDescriptor customMarkerImage;
  getCustomMarker() async {
    customMarkerImage = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/images/cart.png',
    );
  }

//   finally _  circles
  Set<Circle> circles = Set.from([
    Circle(
        circleId: CircleId("1"),
        center: LatLng(24.723201041398024, 46.67196272469909),
        radius: 5000,
        fillColor: Colors.grey.withOpacity(.4),
        strokeWidth: 0,
        visible: true)
  ]);
//  -------------------------------------------------------------------- (end of google maps functions part )
}
