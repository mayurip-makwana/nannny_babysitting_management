import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nanny_vanny/widget/drawer_menu_widget.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json decoding

class Package {
  final String title;
  final String price;
  final String desc;

  // Constructor
  Package({required this.title, required this.price, required this.desc});

  // Factory constructor for creating a new Package instance from JSON
  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      title: json['title'].toString(), // Convert ID to String if necessary
      price:
          json['price'], // Assuming package_name is the field name in the JSON
      desc: json['desc'],
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback openDrawer;
  Color lightPink = Color(0xFFD37CA5);
  final String packageName;
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  // final List<Package> packages;
  // final Future<List<dynamic>> packagesFuture;

  // List<Package> _packages = [];

  // Future<void> _fetchPackages() async {
  //   final response = await http.get(
  //       Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list'));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body) as List;
  //     setState(() {
  //       _packages = data.map((item) => Package.fromJson(item)).toList();
  //     });
  //   } else {
  //     // handle API error
  //     print('Error fetching packages: ${response.statusCode}');
  //   }
  // }

  HomePage({
    Key? key,
    required this.openDrawer,
    required this.packageName,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    // required this.packages
  }) :
        // packagesFuture = fetchPackages(),
        super(key: key);

  Future<List<Package>> fetchPackages() async {
    final response = await http.get(
        Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list'));

    if (response.statusCode == 200) {
      final jsonResponse =
          jsonDecode(response.body); // Decode the JSON response
      print(jsonResponse);
      List<dynamic> packageList =
          jsonResponse['response']; // Access the 'data' field

      // Convert the list of dynamic objects to a list of Package objects
      return packageList.map((json) => Package.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load packages');
    }
  }
  // static Future<List<dynamic>> fetchPackages() async {
  //   final url =
  //       Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list');

  //   try {
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);

  //       // if (data.containsKey('packages')) {
  //       return (data['response'] as List)
  //           .map((jsonItem) => Package.fromJson(jsonItem))
  //           .toList();
  //       // } else {
  //       //   throw Exception('Unexpected JSON structure: Missing "packages" key');
  //       // }
  //     } else {
  //       throw Exception(
  //           'Failed to load packages. Status Code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load packages: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    DateTime startTimes = DateTime.fromMicrosecondsSinceEpoch(
      startDate.microsecondsSinceEpoch +
          startTime.hour * 60 * 60 * 1000 +
          startTime.minute * 60 * 1000,
    );
    DateTime endTimes = DateTime.fromMicrosecondsSinceEpoch(
      endDate.microsecondsSinceEpoch +
          endTime.hour * 60 * 60 * 1000 +
          endTime.minute * 60 * 1000,
    );
    final randomNumber = Random().nextInt(10) + 1;
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuWidget(
          onCliked: openDrawer,
        ),
        backgroundColor: Colors.white,
        // title: Text('Home Page')
      ),
      body: ListView(padding: EdgeInsets.zero, children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 90,
                width: 90, // Ensure it's a circle
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: lightPink, // Pink border for the circle
                    width: 4.0,
                  ),
                ),
                child: Image.asset('assets/images/news.png'),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 16.0), // Adjust the value as needed
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black, // Light pink text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.0),
                    child: const Text(
                      'Emily Cyrus',
                      style: TextStyle(
                        color: Color(0xFFD37CA5), // Light pink text color
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Text for "Nanny And Babysitting Services"
                ],
              ),
              SizedBox(height: 20),
              Stack(
                clipBehavior:
                    Clip.none, // Allows the image to be outside the container
                alignment: Alignment.topCenter,
                children: [
                  // The card container
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 400,
                    decoration: BoxDecoration(
                      color: Color(0xFFE5A2C3), // Soft pink background color
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60), // Space for the image to overlap
                        Text(
                          "Nanny And",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Babysitting Services",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add action for booking
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text(
                            "Book Now",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image over the container
                  Container(
                    // margin: EdgeInsets.only(left: 250.0, top: 30.0),
                    child: Positioned(
                      top: -40,
                      left: 200,
                      // Controls how much of the image is over the container
                      child: Container(
                        height: 300, // Adjust image height as needed
                        child: Image.asset(
                          'assets/images/mom.png', // Your image file path
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(right: 200.0),
                    child: Text(
                      'Your Current Booking',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 480,
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'One Day Package',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('From:'),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat('dd.MM.yyyy').format(startDate),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat('hh:mm a').format(startTimes),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('To:'),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat('dd.MM.yyyy').format(endDate),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat('hh:mm a').format(endTimes),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle start button logic here
                              },
                              child: Text('Start'),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star),
                                const SizedBox(width: 2),
                                Text('Rate Us'),
                                const SizedBox(width: 8),
                                const Icon(Icons.location_on),
                                const SizedBox(width: 2),
                                Text('Geolocation'),
                                const SizedBox(width: 8),
                                const Icon(Icons.security),
                                const SizedBox(width: 2),
                                Text('Surveillance'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 300.0),
                    child: Text(
                      'Packages',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // FutureBuilder<List<Package>>(
              //   future: _packagesFuture,
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       return Center(child: Text('Error: ${snapshot.error}'));
              //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //       return Center(child: Text('No packages found.'));
              //     }

              //     final packages = snapshot.data!;

              //     return ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: packages.length,
              //       itemBuilder: (context, index) {
              //         final package = packages[index];
              //         return ListTile(
              //           title: Text(package.title),
              //         );
              //       },
              //     );
              //   },
              // ),
            ]),
      ]),
    );
  }
}

// class PackageCard extends StatelessWidget {
//   final Package package;

//   const PackageCard({required this.package});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               package.name,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               '₹ ${package.price}',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8),
//             if (package.imageUrl.isNotEmpty) // Check if image URL is available
//               Image.network(
//                 package.imageUrl,
//                 height: 100,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             const SizedBox(height: 8),
//             Text(
//               package.description,
//               maxLines: 3, // Limit description lines
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Assuming you have a list of dummy package data
// Future<List<Package>> fetchPackagess() async {
//   // Simulate network delay
//   await Future.delayed(Duration(seconds: 2));

//   // Fetch or generate the list of packages
//   return [
//     Package(title: 'Package 1', price: '10.00'),
//     Package(title: 'Package 2', price: '20.00'),
//     // Add more packages here
//   ];
// }
