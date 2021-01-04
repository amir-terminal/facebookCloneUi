import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTapBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  CustomTapBar({this.icons, this.onTap, this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TabBar(
          indicator: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
          tabs: icons
              .asMap()
              .map((i, e) => MapEntry(
                  i,
                  Tab(
                      icon: Icon(
                    e,
                    color:
                        i == selectedIndex ? Palette.facebookBlue : Colors.grey,
                    size: 30.0,
                  ))))
              .values
              .toList(),
          onTap: onTap),
    );
  }
}
