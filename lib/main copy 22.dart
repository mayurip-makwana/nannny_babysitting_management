import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('Sliding Drawer Example'),
        // ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;
  int _selectedDestination = 0;
  Color lightPink = Color(0xFFD37CA5);
  final List<String> _items = List<String>.generate(20, (i) => "Item $i");

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _drawerAnimation = Tween<double>(begin: 0, end: 250).animate(_controller);
  }

  void toggleDrawer() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content that shifts to the right with top margin
        AnimatedBuilder(
          animation: _drawerAnimation,
          builder: (context, child) {
            // Adding a 50px margin at the top after shifting
            double topMargin = 50 * (_drawerAnimation.value / 250);
            return Transform.translate(
              offset: Offset(_drawerAnimation.value, topMargin),
              child: child,
            );
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Home'),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: toggleDrawer,
              ),
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Row(
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
                      ],
                    ),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius:
                    //         BorderRadius.circular(16.0), // Rounded corners
                    //   ),
                    //   color: Color(0xFFF4C2C2), // Light pink background color
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16.0),
                    //     child: Row(
                    //       children: [
                    //         // Left side: Text content
                    //         Expanded(
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Nanny And Babysitting Services',
                    //                 style: TextStyle(
                    //                   fontSize: 20.0,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.black, // Text color
                    //                 ),
                    //               ),
                    //               SizedBox(height: 16.0),
                    //               ElevatedButton(
                    //                 onPressed: () {},
                    //                 style: ElevatedButton.styleFrom(
                    //                   backgroundColor:
                    //                       Colors.black, // Button color
                    //                   shape: RoundedRectangleBorder(
                    //                     borderRadius:
                    //                         BorderRadius.circular(20.0),
                    //                   ),
                    //                   padding: EdgeInsets.symmetric(
                    //                     horizontal: 24.0,
                    //                     vertical: 12.0,
                    //                   ),
                    //                 ),
                    //                 child: Text('Book Now'),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         // Right side: Image content
                    //         Image.asset(
                    //           'assets/images/mom.png', // Replace with your image path
                    //           height: 120.0,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // ListView.builder(
                //   padding: EdgeInsets.all(10),
                //   itemCount: _items.length,
                //   itemBuilder: (context, index) {
                //     return Card(
                //       margin: EdgeInsets.symmetric(vertical: 8),
                //       child: ListTile(
                //         leading: Icon(Icons.label),
                //         title: Text(_items[index]),
                //         subtitle: Text('Description for ${_items[index]}'),
                //         trailing: Icon(Icons.arrow_forward),
                //         onTap: () {
                //           // Handle card tap if needed
                //         },
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
        // The Drawer
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          width: 250, // Width of the drawer
          child: AnimatedBuilder(
            animation: _drawerAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_drawerAnimation.value - 250, 0),
                child: Material(
                  elevation: 8,
                  color: Colors.white,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      // From HERE
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
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
                          const SizedBox(height: 5),
                          const Text(
                            'Emily Cyrus',
                            style: TextStyle(
                              color: Color(0xFFD37CA5), // Light pink text color
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          child: ListTile(
                            title: const Text('Home'),
                            textColor: Colors.black,
                            selectedColor: lightPink,
                            selectedTileColor: Colors.blue.shade200,
                            tileColor: Colors.white,
                            selected: _selectedDestination == 0,
                            onTap: () => selectDestination(0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0), // Adjust the left margin here
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          // Adjust the left margin here
                          child: ListTile(
                            //leading: const Icon(Icons.favorite , color: Colors.black,),
                            title: const Text('Book A Nanny'),
                            textColor: Colors.black,
                            selectedColor: lightPink,
                            selectedTileColor: Colors.blue.shade200,
                            tileColor: Colors.white,
                            selected: _selectedDestination == 1,
                            onTap: () => selectDestination(1),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0), // Adjust the left margin here
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          // Adjust the left margin here
                          child: ListTile(
                            //leading: const Icon(Icons.search , color: Colors.black,),
                            title: const Text('How It Works'),
                            textColor: Colors.black,
                            selectedColor: lightPink,
                            selectedTileColor: Colors.blue.shade200,
                            tileColor: Colors.white,
                            selected: _selectedDestination == 2,
                            onTap: () => selectDestination(2),
                          ),
                        ),
                      ),
                      // const Divider(height: 1, thickness: 1,),
                      // Container(
                      //   padding: EdgeInsets.all(16.0),
                      //   color: Colors.grey.shade300,
                      //   child: Text('Account',style: TextStyle(color: Colors.black, fontSize: 16.0),),
                      // ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0), // Adjust the left margin here
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          // Adjust the left margin here
                          child: ListTile(
                            //leading: const Icon(Icons.notifications, color: Colors.black,),
                            title: const Text('Why Nanny Vanny'),
                            textColor: Colors.black,
                            selectedColor: lightPink,
                            selectedTileColor: Colors.blue.shade200,
                            tileColor: Colors.white,
                            selected: _selectedDestination == 3,
                            onTap: () => selectDestination(3),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0), // Adjust the left margin here
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          // Adjust the left margin here
                          child: ListTile(
                            // leading: const Icon(Icons.settings, color: Colors.black,),
                            title: const Text('My Bookings'),
                            textColor: Colors.black,
                            selectedColor: lightPink,
                            selectedTileColor: Colors.blue.shade200,
                            tileColor: Colors.white,
                            selected: _selectedDestination == 4,
                            onTap: () => selectDestination(4),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0), // Adjust the left margin here
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          // Adjust the left margin here
                          child: ListTile(
                            // leading: const Icon(Icons.logout, color: Colors.black,),
                            title: const Text('My Profile'),
                            textColor: Colors.black,
                            selectedColor: lightPink,
                            selectedTileColor: Colors.blue.shade200,
                            tileColor: Colors.white,
                            selected: _selectedDestination == 5,
                            onTap: () => selectDestination(5),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0), // Adjust the left margin here
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          // Adjust the left margin here
                          child: ListTile(
                            // leading: const Icon(Icons.logout, color: Colors.black,),
                            title: const Text('Support'),
                            textColor: Colors.black,
                            selectedColor: lightPink,
                            selectedTileColor: Colors.blue.shade200,
                            tileColor: Colors.white,
                            selected: _selectedDestination == 6,
                            onTap: () => selectDestination(6),
                          ),
                        ),
                      ),
                      // TO HERE
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
    toggleDrawer();
    // Navigator.of(context).pop();
  }
}
