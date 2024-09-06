import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanny_vanny/data/drawer_items.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onCliked;

  const DrawerMenuWidget({
    Key? key,
    required this.onCliked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        icon: FaIcon(FontAwesomeIcons.alignLeft),
        color: Colors.black,
        onPressed: onCliked,
      );
}
