import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nanny_vanny/widget/drawer_menu_widget.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

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

class HomePage extends StatefulWidget {
  final VoidCallback openDrawer;
  final String packageName;
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  HomePage({
    Key? key,
    required this.openDrawer,
    required this.packageName,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Package>> _packagesFuture;
  Color lightPink = Color(0xFFD37CA5);

  @override
  void initState() {
    super.initState();
    _packagesFuture = fetchPackages();
  }

  Future<List<Package>> fetchPackages() async {
    final response = await http.get(
      Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      List<dynamic> packageList = jsonResponse['response'];
      print(packageList);
      return packageList.map((json) => Package.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load packages');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime startTimes = DateTime.fromMicrosecondsSinceEpoch(
      widget.startDate.microsecondsSinceEpoch +
          widget.startTime.hour * 60 * 60 * 1000 +
          widget.startTime.minute * 60 * 1000,
    );
    DateTime endTimes = DateTime.fromMicrosecondsSinceEpoch(
      widget.endDate.microsecondsSinceEpoch +
          widget.endTime.hour * 60 * 60 * 1000 +
          widget.endTime.minute * 60 * 1000,
    );
    final randomNumber = Random().nextInt(10) + 1;

    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuWidget(onCliked: widget.openDrawer),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: lightPink,
                    width: 4.0,
                  ),
                ),
                child: Image.asset('assets/images/news.png'),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16.0),
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
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
                        color: Color(0xFFD37CA5),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFFE5A2C3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        Text(
                          "Nanny And",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Babysitting Services",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                          ),
                          child: Text(
                            "Book Now",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: 150,
                    child: Container(
                      height: 300,
                      child: Image.asset(
                        'assets/images/mom.png',
                        fit: BoxFit.contain,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'One Day Package',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 183, 29, 18),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add your onPressed functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 183,
                                    29, 18), // Button background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10), // Button padding
                              ),
                              child: Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 18, // Text size
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Text('From:'),
                        //         const SizedBox(width: 8),
                        //         Text(
                        //           DateFormat('dd.MM.yyyy')
                        //               .format(widget.startDate),
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //         const SizedBox(width: 8),
                        //         Text(
                        //           DateFormat('hh:mm a').format(startTimes),
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //       ],
                        //     ),
                        //     Column(
                        //       children: [
                        //         Text('To:'),
                        //         const SizedBox(width: 8),
                        //         Text(
                        //           DateFormat('dd.MM.yyyy')
                        //               .format(widget.endDate),
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //         const SizedBox(width: 8),
                        //         Text(
                        //           DateFormat('hh:mm a').format(endTimes),
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('From'),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today),
                                      Text(
                                        DateFormat('dd.MM.yyyy')
                                            .format(widget.startDate),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time),
                                      const SizedBox(width: 4),
                                      Text(
                                        DateFormat('dd.MM.yyyy')
                                            .format(widget.endDate),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('To'),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today),
                                      Text(
                                        DateFormat('dd.MM.yyyy')
                                            .format(widget.startDate),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time),
                                      const SizedBox(width: 4),
                                      Text(
                                        DateFormat('dd.MM.yyyy')
                                            .format(widget.endDate),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // Align icons to the left
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors
                                                  .white), // Add your desired icon
                                          const SizedBox(
                                              width:
                                                  8), // Add spacing between icon and text
                                          Text(
                                            "Rate us",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5.0),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          // Align icons to the left
                                          children: [
                                            Icon(Icons.location_on,
                                                color: Colors
                                                    .white), // Add your desired icon
                                            const SizedBox(
                                                width:
                                                    8), // Add spacing between icon and text
                                            Text(
                                              "Geolocation",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5.0),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          // Align icons to the left
                                          children: [
                                            Icon(Icons.mic,
                                                color: Colors
                                                    .white), // Add your desired icon
                                            const SizedBox(
                                                width:
                                                    8), // Add spacing between icon and text
                                            Text(
                                              "Survillence",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                    margin: EdgeInsets.only(right: 200.0),
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
              FutureBuilder<List<Package>>(
                future: _packagesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No packages found.'));
                  }

                  final packages = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: packages.length,
                    itemBuilder: (context, index) {
                      final package = packages[index];
                      final color =
                          index % 2 == 0 ? Colors.pink[100] : Colors.blue[100];
                      final colors = index % 2 == 0
                          ? const Color.fromARGB(255, 208, 23, 94)
                          : const Color.fromARGB(255, 255, 255, 255);
                      final colorss = index % 2 == 0
                          ? const Color.fromARGB(255, 220, 43, 105)
                          : const Color.fromARGB(255, 2, 148, 252);
                      return Card(
                        color: color,
                        elevation: 2.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Push texts to opposite sides
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 16.0),
                                    child: Stack(
                                      alignment: Alignment
                                          .center, // Align the number in the center of the icon
                                      children: [
                                        // The calendar icon
                                        Icon(
                                          Icons.calendar_today,
                                          size: 30.0,
                                          color:
                                              colors, // Set your desired color
                                        ),
                                        // The random number inside the icon
                                        Positioned(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              randomNumber.toString(),
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors
                                                    .white, // Color of the text
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your onPressed functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          colorss, // Button background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            30.0), // Rounded corners
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10), // Button padding
                                    ),
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(
                                        color: Colors.white, // Text color
                                        fontSize: 18, // Text size
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Package title
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Push texts to opposite sides
                                children: [
                                  Text(
                                    package.title,
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 4, 129, 231),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '₹ ${package.price}',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 4, 129, 231),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Placeholder for an image URL, uncomment if image URLs are available
                              // if (package.imageUrl.isNotEmpty)
                              //   Image.network(
                              //     package.imageUrl,
                              //     height: 100,
                              //     width: double.infinity,
                              //     fit: BoxFit.cover,
                              //   ),
                              // const SizedBox(height: 8),

                              // Package description or any additional data (if available)
                              Text(
                                package
                                    .desc, // Replace with actual data if available, e.g., package.description
                                maxLines: 3, // Limit description lines
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
