import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Partial Drawer Example'),
        ),
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _drawerAnimation = Tween<double>(begin: -300, end: 0).animate(_controller);
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
        Center(
          child: ElevatedButton(
            onPressed: toggleDrawer,
            child: Text('Toggle Drawer'),
          ),
        ),
        AnimatedBuilder(
          animation: _drawerAnimation,
          builder: (context, child) {
            return Positioned(
              left: _drawerAnimation.value,
              top: 0,
              bottom: 0,
              width: 250, // Width of the drawer
              child: Material(
                elevation: 8,
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Partial Drawer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
