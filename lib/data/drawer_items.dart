import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanny_vanny/model/drawer_item.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home');
  // , icon: FontAwesomeIcons.home);
  static const nanny = DrawerItem(title: 'Book A Nanny');
  static const how = DrawerItem(title: 'How It Works');
  static const why = DrawerItem(title: 'Why Nanny Vanny');
  static const book = DrawerItem(title: 'My Bookings');
  static const pro = DrawerItem(title: 'My Profile');
  static const sup = DrawerItem(title: 'Support');
  // , icon: FontAwesomeIcons.explosion);

  static final List<DrawerItem> all = [home, nanny, how, why, book, pro, sup];
}
