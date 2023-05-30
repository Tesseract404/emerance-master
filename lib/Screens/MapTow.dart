import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:emerance/widgets/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/actionButtonwithIcon.dart';class MapTow extends StatefulWidget {
  const MapTow({Key? key}) : super(key: key);

  @override
  State<MapTow> createState() => _MapTowState();
}

class _MapTowState extends State<MapTow> {
  Completer<GoogleMapController> _controller = Completer();
  Uint8List? markerImage;
  List<String> images = [
    'assets/tow.png', 'assets/tow.png', 'assets/tow.png',
    'assets/tow.png', 'assets/tow.png', 'assets/tow.png',
    'assets/tow.png', 'assets/tow.png', 'assets/tow.png',
    'assets/tow.png', 'assets/tow.png', 'assets/tow.png',


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
   LatLng(1.492642, 103.741545), LatLng(1.502288, 103.749249), LatLng(1.461597, 103.762166),
    LatLng(1.463500, 103.773499), LatLng(1.488868, 103.770686), LatLng(1.493367, 103.767223),
    LatLng(1.484292, 103.775207),LatLng(1.485884, 103.759975), LatLng(1.471945, 103.736972),
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
                  title: 'Tow Truck',
                onTap: (){
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    ),
                    context: context, builder: (context)=> Container(
                    height: 250,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      color: Colors.white54,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 8, 0),
                          child: Row(
                            children: [Image(image: AssetImage('assets/tow.png'),height: 45,width:45 ,),SizedBox(width: 20,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text('Tow Truck '+i.toString(),style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                ),),
                              ),SizedBox(width: 150,),
                              Text('available ' ,style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.greenAccent
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              actionButtonwithIcon(title:'Call',route: '/call',
                                  height: 0.05, width: 0.35,
                                  icons: Icons.phone, iconsize: 20,
                                  iconcolor: CupertinoColors.white),
                              SizedBox(width: 40,),
                              actionButtonwithIcon(title:'Chat',route: '/map_a',
                                  height: 0.05, width: 0.35,
                                  icons: Icons.chat, iconsize: 20,
                                  iconcolor: CupertinoColors.white),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),

                  );
                }
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
            'Pick your nearest\nTow Truck',
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
