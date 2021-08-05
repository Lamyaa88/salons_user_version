import 'dart:async';
import 'dart:collection';
import 'package:almezyn/screens/other/order_screen.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class PickUserLocationScreen extends StatefulWidget {
  final double lat ;
  final double long ;

  PickUserLocationScreen(this.lat , this.long);
  @override
  _PickUserLocationScreenState createState() => _PickUserLocationScreenState(lat ,long);
}
class _PickUserLocationScreenState extends State<PickUserLocationScreen> {
  final double lat ;
  final double long ;

  double orderLat ;
  double orderLong ;
  _PickUserLocationScreenState(this.lat, this.long);


  //--------------------------------------

  List<Placemark> placeMarks = [];
  String userPickedLocation = "";
  double locationLat = 20.43455;
  double locationLong = 50.333333;
  getLocation(double pickedLat , double pickedLong  , context  ) async {
    placeMarks = await placemarkFromCoordinates(pickedLat ,pickedLong);
    print(placeMarks[0].street);
    setState(() {
      userPickedLocation  = "name: ${placeMarks[0].name} \n Street : ${placeMarks[0].street}"
          " \n  subAdministrativeArea :${placeMarks[0].subAdministrativeArea} "
          "\n  administrativeArea : ${placeMarks[0].administrativeArea}  "
          "\n country :${placeMarks[0].country} ";
      print("lcation is ${userPickedLocation}") ;
      showCustomAlertDialog(context: context ,onTapClose: (){Navigator.of(context).pop();} , onTapOk: (){
        Navigator.of(context).pop();
        customPushNamedNavigation(context,
            OrderScreen(lat: orderLat , long:  orderLong , location: userPickedLocation,));

      } , alertTitle:
      translator.translate("Use This Location") , alertSubtitle: "${userPickedLocation} "
          "\n \n\n lat : ${orderLat.toString()} \n long ${orderLong.toString()}");
    });
  }
//
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: map(context)
    );
  }
  Widget map(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          child: GoogleMap(
            onTap:(latLng) async{
              print('${latLng.latitude}, ${latLng.longitude}');
              setState(() {
                orderLat = latLng.latitude ;
                orderLong = latLng.longitude ;
                print("orderLat is ${orderLat} orderlong is ${orderLong}");
              });
              getLocation(latLng.latitude, latLng.longitude , context );


            },
            onMapCreated: _onMapCreated,
//            markers: markers,
//            circles: circles,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat,long),
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
//  const LatLng(29.921650833842286, 30.930623376681833);

// second _ on map created
  void _onMapCreated(GoogleMapController controller) {

    _controller.complete(controller);
    setState(() {
      markers.add(
        Marker(
            markerId: MarkerId("1"),
            position: LatLng(lat,long),
            infoWindow: InfoWindow(

              title: "",
              snippet:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
            )
        ),
      );
    }
    );}

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
//    Circle(
//        circleId: CircleId("7"),
//        center: LatLng(28.121650833842286, 30.930623376681833),
//        radius: 5000,
//        fillColor: Colors.grey.withOpacity(.4),
//        strokeWidth: 0,
//        visible: true)
  ]);
//  -------------------------------------------------------------------- (end of google maps functions part )





//------------------------------- alert dialog
  Future showCustomAlertDialog(

      {BuildContext context, String alertTitle ,String alertSubtitle , Function onTapClose , Function onTapOk }) {
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
                      width: width(context)*.5,
                  decoration:
                      BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Location Marker.gif"),fit: BoxFit.fill )),
                  ),
                responsiveSizedBox(context: context, percentageOfHeight: .0),
                customBoldText(context: context, text: alertTitle ),
                responsiveSizedBox(context: context, percentageOfHeight: .02),
                customDescriptionTextText(context: context, text: alertSubtitle , maxLines: 40),
                responsiveSizedBox(context: context, percentageOfHeight: .02),

              ],
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(
                height(context) * .02,
              ),
              child: Row(
                children: [
              GestureDetector(
        child:
        customDescriptionTextText(context: context, text: translator.translate("Cancel"),
        textColor: blueColor
        , percentageOfHeight: .025 , fontWeight: FontWeight.bold ),
        onTap: onTapClose ),
                  SizedBox(width: width(context)*.05,),
                  GestureDetector(
                      child:
                      customDescriptionTextText(context: context, text: translator.translate("Ok") ,

                          textColor: blueColor
                          , percentageOfHeight: .025 , fontWeight: FontWeight.bold ),
                      onTap: onTapOk )]
              ),
            ),
          ],
        );
      },
    );
  }
}



