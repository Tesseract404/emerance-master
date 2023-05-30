import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:emerance/widgets/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapAmbulance extends StatefulWidget {
  const MapAmbulance({Key? key}) : super(key: key);

  @override
  State<MapAmbulance> createState() => _MapAmbulanceState();
}
class _MapAmbulanceState extends State<MapAmbulance> {
  Completer<GoogleMapController> _controller = Completer();
  Uint8List? markerImage;
  List<String> images = [
    'assets/siren.png', 'assets/siren.png', 'assets/siren.png',
    'assets/siren.png', 'assets/siren.png', 'assets/siren.png',
    'assets/siren.png', 'assets/siren.png', 'assets/siren.png',
    'assets/siren.png', 'assets/siren.png', 'assets/siren.png',
    'assets/siren.png', 'assets/siren.png', 'assets/siren.png',
    'assets/siren.png', 'assets/siren.png', 'assets/siren.png',

  ];

  static final CameraPosition _kGooglePlex =const CameraPosition(
      target: LatLng(1.4913138547565494, 103.73674531405369),
    zoom: 14,
  );
  //final List<Marker> _marker =[];
   final List<Marker> _marker = <Marker>[
    Marker(markerId: MarkerId('1'),
      position: LatLng(1.4913138547565494, 103.73674531405369),
      infoWindow: InfoWindow(
        title: "You're here"
      )
    )
  ];
 final List<LatLng> _latLang = <LatLng>[
  LatLng(1.494975, 103.743454),LatLng(1.496102, 103.743321),LatLng(1.492642, 103.741545),
  LatLng(1.496310, 103.737716),LatLng(1.491085, 103.752399),LatLng(1.502288, 103.749249),
  LatLng(1.461597, 103.762166),LatLng(1.463500, 103.773499),LatLng(1.488868, 103.770686),
  LatLng(1.493367, 103.767223),LatLng(1.484292, 103.775207),LatLng(1.485884, 103.759975),
  LatLng(1.471945, 103.736972),LatLng(1.476575, 103.749747),LatLng(1.466579, 103.756957),
  LatLng(1.456739, 103.751713),LatLng(1.477658, 103.724549),LatLng(1.490868, 103.744144),


  ];

  Future<Uint8List> getBytesFromAssets(String path , int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),targetHeight:width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     loadData();

  }
  loadData() async{
    for(int i= 0;i<_latLang.length; i++){

      final Uint8List markerIcon = await getBytesFromAssets(images[i], 100);
      _marker.add(
        Marker(markerId: MarkerId(i.toString()),
          position: _latLang[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: 'Ambulance'
          )
        ));
      setState(() {
      });
    }
    // getUserCurrentLocation().then((value)async{
    //   print('my current location');
    //   print(value.latitude.toString()+" "+value.longitude.toString());
    //   _marker.add(
    //       Marker(
    //           markerId: MarkerId('2'),
    //           position: LatLng(value.latitude,value.longitude),
    //           infoWindow: InfoWindow(
    //               title: "You're Here"
    //           )
    //       )
    //   );
    //   CameraPosition cameraPosition = CameraPosition(
    //       zoom: 14,
    //       target: LatLng(value.latitude,value.longitude));
    //   final GoogleMapController controller = await _controller.future;
    //   controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    //   setState(() {
    //
    //   });
    //
    // });
  }

  Future<Position> getUserCurrentLocation() async{

    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace)async {
      await Geolocator.requestPermission();
      setState(() {
        toasts.toastMessage('Something went wrong!');
      });
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 150,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5,  5, 1),
          child: Text(
            'Pick your nearest\nAmbulance',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
                fontSize: 35,
                fontWeight: FontWeight.w700
            ),
          ),
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              colors: [Color(0xff2ac74e),Color(0xff008c6e)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
        ),

      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.terrain,
          markers: Set<Marker>.of(_marker),
           myLocationEnabled: true,
           myLocationButtonEnabled: true,
           compassEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.location_circle_fill),
        onPressed: ()async {
          getUserCurrentLocation().then((value)async{
            print('my current location');
            print(value.latitude.toString()+" "+value.longitude.toString());
            _marker.add(
              Marker(
                  markerId: MarkerId('2'),
                 position: LatLng(value.latitude,value.longitude),
                infoWindow: InfoWindow(
                  title: "You're Here"
                )
              )
            );
            CameraPosition cameraPosition = CameraPosition(
            zoom: 14,
                target: LatLng(value.latitude,value.longitude));
            final GoogleMapController controller = await _controller.future;
             controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
             setState(() {

             });
            
          });
        },
      ),
    );
  }
}
