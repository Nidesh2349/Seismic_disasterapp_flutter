import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String randomNumber = '';
  String message = '';

  @override
  void initState() {
    super.initState();
    fetchRandomNumber();
  }

  Future<void> fetchRandomNumber() async {
    var url = Uri.parse('http://localhost:9080');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        randomNumber = response.body;
        setMessage(int.parse(randomNumber));
        showAlert();
      });
    }
  }

  void setMessage(int number) {
    if (number < 5) {
      message = 'felt by all; minor breakage of objects';
    } else if (number >= 5 && number < 7) {
      message = 'moderate damage in populated areas';
    } else if (number >= 7 && number < 9) {
      message =
          'severe destruction and loss of life over large areas-----> Go for Emergency Contacts';
    } else {
      message = 'Unknown';
    }
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Message: $message"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.white, size: 50.0),
                  Image.asset(
                    "assets/user.png",
                    width: 50.0,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    // Your existing GestureDetector widgets...
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocsPage()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Color.fromARGB(255, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/folder.png",
                                    width: 64,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("DOCS",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  SizedBox(height: 5.0),
                                  Text("Seismic",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add navigation logic for PrecautionsPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrecautionsPage()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Color.fromARGB(255, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/precaution.png",
                                    width: 64,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("PreCautions",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  SizedBox(height: 5.0),
                                  Text("Seismic",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add navigation logic for LiveMapPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LiveMapPage()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Color.fromARGB(255, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/Map.png",
                                    width: 64,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("LiveMap",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  SizedBox(height: 5.0),
                                  Text("Seismic",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add navigation logic for EmergencyContactsPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmergencyContactsPage()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Color.fromARGB(255, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/emergency.png",
                                    width: 64,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("EmergencyContacts",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0)),
                                  SizedBox(height: 5.0),
                                  Text("Seismic",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // SizedBox to display the random number from the server
                    SizedBox(
                      width: 340.0,
                      height: 160.0,
                      child: Card(
                        color: Color.fromARGB(255, 0, 0, 0),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Random Value from Server: $randomNumber",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DocsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docs"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "EPICENTER (Earthquake Prediction)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                "assets/epi.png",
                width: MediaQuery.of(context).size.width, // Adjusted width
              ),
              SizedBox(height: 20),
              Text(
                "GEOLOGICAL MAP OF GANGTOK AREA",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                "assets/geo.png",
                width: MediaQuery.of(context).size.width, // Adjusted width
              ),
              SizedBox(height: 20),
              Text(
                "Seismograph",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                "assets/seismograph.png",
                width: MediaQuery.of(context).size.width, // Adjusted width
              ),
              SizedBox(height: 20),
              Text(
                "Sevearity Scale",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                "assets/sevearity.png",
                width: MediaQuery.of(context).size.width, // Adjusted width
              ),
              SizedBox(height: 10),
              Text(
                "Location of Seismograph Station",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                "assets/location.png",
                width: MediaQuery.of(context).size.width, // Adjusted width
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrecautionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Precautions"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Drop. Cover. Hold on.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  """
In most situations, you can protect yourself if you immediately:

DROP down onto your hands and knees before the earthquake knocks you down. This position protects you from falling but allows you to still move if necessary.
COVER your head and neck (and your entire body if possible) underneath a sturdy table or desk. If there is no shelter nearby, get down near an interior wall or next to low-lying furniture that won’t fall on you, and cover your head and neck with your arms and hands.
HOLD ON to your shelter (or to your head and neck) until the shaking stops. Be prepared to move with your shelter if the shaking shifts it around.
""",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "If you are in a high-rise building.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  """

Move away from windows and outside walls.
Stay in the building.
DO NOT use the elevators. The electricity may go out, and the sprinkler systems may come on.
If you are trapped, stay calm. Try to get someone’s attention by tapping on hard or metal parts of the structure. Doing so may increase your chances of being rescued.
""",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "If you are inside a crowded place.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  """

Do not rush for the doorways. Others will have the same idea.
Move away from display shelves containing objects that may fall.
If you can, take cover and grab something to shield your head and face from falling debris and glass.""",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveMapPage extends StatefulWidget {
  @override
  _LiveMapPageState createState() => _LiveMapPageState();
}

class _LiveMapPageState extends State<LiveMapPage> {
  // Set of predefined markers
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('emergency_1'),
      position: LatLng(27.338936, 88.606506),
      infoWindow: InfoWindow(title: 'Emergency 1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: MarkerId('emergency_2'),
      position: LatLng(27.340500, 88.610500),
      infoWindow: InfoWindow(title: 'Emergency 2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    // Add more predefined markers as needed
  };

  // Predefined live location
  final LatLng _liveLocation =
      LatLng(27.340, 88.608); // Example live location in Gangtok

  late GoogleMapController _mapController;

  // Initial camera position for the map
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(27.338936, 88.606506),
    zoom: 12.5,
  );

  @override
  void initState() {
    super.initState();
    // Fit the camera to the markers and live location
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitMarkersAndLiveLocation();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // Fit the camera to the predefined markers and live location
    _fitMarkersAndLiveLocation();
  }

  void _fitMarkersAndLiveLocation() {
    // Combine markers and live location to adjust the camera
    Set<LatLng> points = _markers.map((marker) => marker.position).toSet();
    points.add(_liveLocation); // Add live location to the set

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        points.map((latLng) => latLng.latitude).reduce(min),
        points.map((latLng) => latLng.longitude).reduce(min),
      ),
      northeast: LatLng(
        points.map((latLng) => latLng.latitude).reduce(max),
        points.map((latLng) => latLng.longitude).reduce(max),
      ),
    );

    // Animate the camera to fit the bounds of markers and live location
    _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Map"),
      ),
      body: GoogleMap(
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        markers: _markers, // Display predefined markers on the map
        circles: {
          // Add a circle to represent the user's live location
          Circle(
            circleId: CircleId('live_location'),
            center: _liveLocation,
            radius: 20.0, // Radius in meters
            fillColor: Colors.blue.withOpacity(0.3),
            strokeColor: Colors.blue,
            strokeWidth: 2,
          ),
        },
      ),
    );
  }
}

class EmergencyContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Contacts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Police Helpline Numbers:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "03592-202892 - Landline",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "03592-221152 - Landline",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "8001763383 - Mobile",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "03592-202042 - Fax",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Or call '112' for emergency assistance.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
