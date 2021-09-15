import 'dart:async';
import 'dart:collection';
import 'package:almezyn/utils/file_export.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class SingleSalonLocationScreen extends StatefulWidget {
  final double lat ;
  final double long ;
  SingleSalonLocationScreen(this.lat , this.long);
  @override
  _SingleSalonLocationScreenState createState() => _SingleSalonLocationScreenState(lat ,long);
}
class _SingleSalonLocationScreenState extends State<SingleSalonLocationScreen> {
  final double lat ;
  final double long ;
  _SingleSalonLocationScreenState(this.lat, this.long);
  @override
  Widget build(BuildContext context) {
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
            onMapCreated: _onMapCreated,
            markers: markers,
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
            position: LatLng(lat,long),),
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
    Circle(
        circleId: CircleId("7"),
        center: LatLng(28.121650833842286, 30.930623376681833),
        radius: 5000,
        fillColor: Colors.grey.withOpacity(.4),
        strokeWidth: 0,
        visible: true)
  ]);
//  -------------------------------------------------------------------- (end of google maps functions part )
}



