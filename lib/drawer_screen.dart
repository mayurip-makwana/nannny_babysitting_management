import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  final String title;

  const DrawerScreen({super.key, required this.title});

  @override
  DrawerScreenState createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  int _selectedDestination = 0;
  Color lightPink = Color(0xFFFFB6C1);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightPink,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      drawer: drawerWidget(textTheme),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        // child: ListView(
        //   children: <Widget>[],
        // ),
      ),
    );
  }

  Widget drawerWidget([TextTheme? textTheme]) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        color: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
                    color: Color(0xFFFFB6C1), // Light pink text color
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
                  left: 40.0), // Adjust the left margin here
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
                  left: 40.0), // Adjust the left margin here
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
                  left: 40.0), // Adjust the left margin here
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
                  left: 40.0), // Adjust the left margin here
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
                  left: 40.0), // Adjust the left margin here
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
                  left: 40.0), // Adjust the left margin here
              child: const Divider(
                height: 1,
                thickness: 1,
              ),
            ),
            Container(
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                // Adjust the left margin here
                child: ListTile(
                  // leading: const Icon(Icons.logout, color: Colors.black,),
                  title: const Text('Support'),
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
                  left: 40.0), // Adjust the left margin here
              child: const Divider(
                height: 1,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
    Navigator.of(context).pop();
  }
}
