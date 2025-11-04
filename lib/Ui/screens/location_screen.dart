import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_grocery_app/Ui/controller/auth_controller.dart';
import 'home_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'log_in_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _locationController = TextEditingController();
  final box = GetStorage();
  bool _isLoading = false;

  // Get current location
  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permission denied')),
          );
          setState(() => _isLoading = false);
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            "${place.subLocality ?? ''}, ${place.locality ?? ''}, ${place.subAdministrativeArea ?? ''}, ${place.country ?? ''}";

        setState(() {
          _locationController.text = address;
        });

        print("Current Location: $address");
      }
    } catch (e) {
      print("Error fetching location: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to get location: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Save location & navigate to Home
  Future<void> _saveLocation() async {
    String location = _locationController.text.trim();
    if (location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your location first')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Save in AuthController
    await AuthController.saveLocation(location);

    // Save locally
    box.write('user_location', location);

    // Reset new registration flag
    box.write('is_new_registration', false);

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location saved successfully!')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LogInScreen()),
    );
  }

  @override
  void initState() {
    super.initState();

    // Optionally, try to fetch location automatically on screen open
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        backgroundColor: const Color(0xFF53B175),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _locationController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Your Location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.my_location),
                  onPressed: _getCurrentLocation,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _saveLocation,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF53B175),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Save Location",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
