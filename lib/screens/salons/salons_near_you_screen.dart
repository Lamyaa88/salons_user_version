//import 'dart:async';
//import 'dart:collection';
//
//import 'package:almezyn/screens/salons/single_salon_details.dart';
//import 'package:almezyn/screens/salons/widgets/all_salons_list_view.dart';
//import 'package:almezyn/utils/file_export.dart';
//import 'package:almezyn/screens/more/widgets/user_data.dart';
//import 'package:almezyn/screens/salons/widgets/single_tap_button.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//class SalonsNearYouScreen extends StatefulWidget {
//  final salonId ;
//  SalonsNearYouScreen({this.salonId});
//  @override
//  _SalonsNearYouScreenState createState() => _SalonsNearYouScreenState();
//}
//class _SalonsNearYouScreenState extends State<SalonsNearYouScreen> {
//  bool firstActive  = true ;
//  bool secondActive  = false  ;
//  bool thirdActive  = false  ;
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    return Scaffold(
//      body: map(context)
//    );
//  }
//  Widget map(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: [
//        Container(
//          width: width,
//          height: height,
//          child: GoogleMap(
//            onMapCreated: _onMapCreated,
//            markers: markers,
////            circles: circles,
//            initialCameraPosition: CameraPosition(
//              target: _center,
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
//  static const LatLng _center =
//  const LatLng(29.921650833842286, 30.930623376681833);
//
//// second _ on map created
//  void _onMapCreated(GoogleMapController controller) {
//    _controller.complete(controller);
//    setState(() {
//      markers.add(
//        Marker(
//            markerId: MarkerId("1"),
//            position: LatLng(23.921650833842286, 30.830623376681833),
//            infoWindow: InfoWindow(
//
//              title: "kings salon ",
//              snippet:
//              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
//            )),
//      );
//    }
//    );
//    setState(() {
//      markers.add(
//        Marker(
//          onTap: (){showCustomAlertDialog(context: context , withTwoButtons: true , secondButtoText:
//          "Salon Page" , alertSubtitle: "y dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever sinc"
//              , alertTitle: "Kings salons " , onTapSecondButton: (){
//            Navigator.of(context).pop() ;
//            customAnimatedPushNavigation(context,
//                  SingleSalonDetailsScreen(salonId: "2"));}) ;},
//            markerId: MarkerId("2"),
//            position: LatLng(21.921650833842286, 30.630623376681833),
//            infoWindow: InfoWindow(
//              title: "kings salon ",
//              snippet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
//            )),
//      );
//    }
//    );
//    setState(() {
//      markers.add(
//        Marker(
//            markerId: MarkerId("3"),
//            position: LatLng(25.921650833842286, 30.730623376681833),
//            infoWindow: InfoWindow(
//              title: "kings salon ",
//              snippet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
//            )),
//      );
//    }
//    );   setState(() {
//      markers.add(
//        Marker(
//            markerId: MarkerId("4"),
//            position: LatLng(49.921650833842286, 30.940623376681833),
//            infoWindow: InfoWindow(
//              title: "kings salon ",
//              snippet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
//            )),
//      );
//    }
//    );   setState(() {
//      markers.add(
//        Marker(
//            markerId: MarkerId("5"),
//            position: LatLng(45.921650833842286, 30.160623376681833),
//            infoWindow: InfoWindow(
//              title: "kings salon ",
//              snippet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
//
//            )),
//      );
//    }
//    );
//    setState(() {
//      markers.add(
//        Marker(
//            markerId: MarkerId("6"),
//            position: LatLng(53.951650833842286, 20.930623376681833),
//            infoWindow: InfoWindow(
//              title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
//            )),
//      );
//    }
//    );
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
//        circleId: CircleId("7"),
//        center: LatLng(28.121650833842286, 30.930623376681833),
//        radius: 5000,
//        fillColor: Colors.grey.withOpacity(.4),
//        strokeWidth: 0,
//        visible: true)
//  ]);
////  -------------------------------------------------------------------- (end of google maps functions part )
//}
//
//
//
