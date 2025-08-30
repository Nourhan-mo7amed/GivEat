import 'package:flutter/material.dart';
import 'package:giveat/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  String _address = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      if (permission == LocationPermission.deniedForever) return;

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });

      _getAddressFromLatLng(position.latitude, position.longitude);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    if (placemarks.isNotEmpty) {
      setState(() {
        _address =
            "${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.country}";
        _searchController.text = _address;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Location",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: (controller) => _mapController = controller,
                  initialCameraPosition: CameraPosition(
                    target: _currentPosition!,
                    zoom: 15,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  markers: {
                    Marker(
                      markerId: const MarkerId("currentLocation"),
                      position: _currentPosition!,
                      infoWindow: const InfoWindow(title: "You are here"),
                    ),
                  },
                ),
                // Search Bar
                Positioned(
                  top: 20,
                  left: 15,
                  right: 15,
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      if (_address.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 6),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _address,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                // Locate Me button
                Positioned(
                  bottom: 100,
                  right: 15,
                  child: FloatingActionButton.extended(
                    onPressed: _getCurrentLocation,
                    backgroundColor: Colors.white,
                    icon: const Icon(Icons.my_location, color: Colors.green),
                    label: const Text(
                      "Locate me",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                // Confirm button
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, _currentPosition);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Confirm",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
