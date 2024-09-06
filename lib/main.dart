import 'package:flutter/material.dart';
import 'package:nanny_vanny/data/drawer_items.dart';
import 'package:nanny_vanny/model/drawer_item.dart';
import 'package:nanny_vanny/page/drwaer/home_page.dart';
import 'package:nanny_vanny/widget/drawer_widget.dart';

import 'drawer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              background: Colors.white, seedColor: Colors.purple),
          useMaterial3: true,
          primaryColor: Color.fromRGBO(21, 30, 61, 1)),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late double heightScale;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        heightScale = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 220;
        yOffset = 40;
        heightScale = 0.85;
        isDrawerOpen = true;
      });

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [buildDrawer(), buildPage()],
        ),
      );

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }

          isDragging = false;
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(heightScale),
            child: Container(
              decoration: BoxDecoration(
                // Box shadow properties
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Shadow color
                    spreadRadius: 2, // Spread the shadow
                    blurRadius: 10, // Blur intensity
                    offset: Offset(0, 5), // Vertical shadow offset (x, y)
                  ),
                ],
              ),
              child: AbsorbPointer(
                  absorbing: isDrawerOpen,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isDrawerOpen ? 20 : 0),
                      child: getDrawerPage())),
            )),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.home:
        return HomePage(
          openDrawer: openDrawer,
          packageName: 'hello',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          startTime: TimeOfDay.fromDateTime(DateTime.now()),
          endTime: TimeOfDay.fromDateTime(DateTime.now()),
        );
      default:
        return HomePage(
          openDrawer: openDrawer,
          packageName: 'hello',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          startTime: TimeOfDay.fromDateTime(DateTime.now()),
          endTime: TimeOfDay.fromDateTime(DateTime.now()),
        );
    }
  }

  Widget buildDrawer() => SafeArea(child: DrawerWidget(
        onSelecteditem: (item) {
          setState(() => this.item = item);
          closeDrawer();
        },
      ));
}
