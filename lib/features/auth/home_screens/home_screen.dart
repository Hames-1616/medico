import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:medico/utils/dimentions.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeScreen());
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var current = DateTime.now();
  String displayMessage = "";
  List<String> countries = [
    "Feel Cold",
    "Fever",
    "Vomitting",
    "Coughing",
    "Sneezing",
    "Stomach Pain"
  ];
  @override
  void initState() {
    if (current.hour > 12) {
      displayMessage = "afternoon";
    } else {
      displayMessage = "morning";
    }
  }

  bool show = false;
  String? _currentAddress;
  String? _fullAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _fullAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        _currentAddress = place.subLocality;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 1.5, color: Colors.black45)),
                child: Center(
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.network(
                          "https://img.icons8.com/?size=512&id=mpLSv3Bz8UrX&format=png")),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _getCurrentPosition();
                setState(() {
                  show = true;
                });
                Future.delayed(const Duration(seconds: 5), () {
                  setState(() {
                    show = false;
                  });
                });
              },
              child: Column(
                children: [
                  const Text(
                    'LOCATION',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  show
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          _currentAddress ?? "click to get",
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 1.5, color: Colors.black45)),
                child: Center(
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.network(
                          "https://img.icons8.com/?size=512&id=89245&format=png")),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good $displayMessage,User",
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "How are you today?",
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 22, color: Colors.black),
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 1.4, color: Colors.black54)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Search Doctor for Symptoms",
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.black54),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black54,
                          ))
                    ]),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 45,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 120,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text(countries[index])),
                        ),
                      );
                    })),
            const SizedBox(
              height: 20,
            ),
            ImageSlideshow(
                isLoop: true,
                indicatorColor: Colors.black54,
                indicatorBackgroundColor: Colors.grey,
                height: MediaQuery.of(context).size.height/hei(context, 180),
                autoPlayInterval: 3000,
                width: double.infinity,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: Image.network(
                        "https://img.icons8.com/?size=512&id=5359&format=png"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: Image.network(
                        "https://img.icons8.com/?size=512&id=K01xIyJ7hOqR&format=png"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: Image.network(
                        "https://img.icons8.com/?size=512&id=rzd8OTms7idu&format=png"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: Image.network(
                        "https://img.icons8.com/?size=512&id=61238&format=png"),
                  ),
                ]),
            const SizedBox(height: 20),
            Container(
              // height: 190,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(
                            top: 15, right: 10, left: 10, bottom: 5),
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                      )),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(
                            top: 15, right: 10, left: 10, bottom: 5),
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(
                            top: 15, right: 10, left: 10, bottom: 15),
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                      )),
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  top: 15, right: 10, left: 10, bottom: 15),
                              height: 80,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(15))))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
