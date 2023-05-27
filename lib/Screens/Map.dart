import 'dart:async';
import 'package:emerance/widgets/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}
class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex =const CameraPosition(
      target: LatLng(1.4913138547565494, 103.73674531405369),
    zoom: 14,
  );
   //List<Marker> _marker =[];
   final List<Marker> _marker = <Marker>[
    Marker(markerId: MarkerId('1'),
      position: LatLng(1.4913138547565494, 103.73674531405369),
      infoWindow: InfoWindow(
        title: "You're here"
      )
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loadData();

  }
  loadData(){
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
            'Pick your nearest\nTow Truck',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
                fontSize: 35,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 150,
        elevation: 0,
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
