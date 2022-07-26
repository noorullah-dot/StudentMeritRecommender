import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);


  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controler= Completer();
  static const LatLng _center = LatLng(31.5204, 74.3587);

  List<Marker> marker= [];

  final List<Marker> listMark= [
    const Marker(
    markerId: MarkerId('2'),
    position:LatLng(31.5493646, 74.3235535),
    infoWindow: InfoWindow(title: 'Capital Degree Collage'),
  ),
    const Marker(
    markerId: MarkerId('4'),
    position:LatLng(34.034386, 71.5279039),
    infoWindow: InfoWindow(title: 'ICMS collage peshawar'),
  ),

    const Marker(
    markerId: MarkerId('5'),
    position:LatLng(34.0248615, 71.5754794),
    infoWindow: InfoWindow(title: 'muslim collage of commerce and sciences peshawarr'),
  ),
    const Marker(
    markerId: MarkerId('6'),
    position:LatLng(33.9672098, 71.4926168),
    infoWindow: InfoWindow(title: 'North west institute of sciences peshawar '),
  ),
    const Marker(
    markerId: MarkerId('7'),
    position:LatLng(33.9738126,71.4665604),
    infoWindow: InfoWindow(title: 'IQRA huffaz secondary school and collage peshawar')),

    const Marker(
    markerId: MarkerId('8'),
    position:LatLng(34.0129111,71.5704527),
    infoWindow: InfoWindow(title: 'Govt frontier collage for women peshawar')),

    const Marker(
    markerId: MarkerId('9'),
    position:LatLng(33.9920063,71.4872566),
    infoWindow: InfoWindow(title: 'Gandhara collage of pharmacy peshawar')),

    const Marker(
    markerId: MarkerId('10'),
    position:LatLng(34.012285,71.4602491),
    infoWindow: InfoWindow(title: 'PIMS Education System')),

    const Marker(
    markerId: MarkerId('11'),
    position:LatLng(33.9927437,71.4903819),
    infoWindow: InfoWindow(title: 'institute of professional studies peshawar')),

  ];


  @override
  void initState() {
    marker.addAll(listMark);
    super.initState();
  }
  void _onMapCreation(GoogleMapController _controller)  {
    _controler.complete(_controller);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Location"),
      ),
      body: GoogleMap(

          markers: Set<Marker>.of(marker),
          onMapCreated: _onMapCreation,initialCameraPosition:const CameraPosition(target: _center,zoom:13) ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          getYourLocation().then((value) async{


            marker.add(Marker(markerId: const MarkerId('1'),
                position: LatLng(value.latitude, value.longitude),
            infoWindow: const InfoWindow(title: 'My Current Location')));
            
            CameraPosition cameraPosition= CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 14);

            final GoogleMapController controler = await _controler.future;

          controler.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

          setState(() {

          });
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add_location),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future<Position> getYourLocation() async{
    await Geolocator.checkPermission().then((value) {}).onError((error, stackTrace){
      print('error'+error.toString());
    } );
      return await Geolocator.getCurrentPosition();
  }
}
