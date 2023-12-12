// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:case_study_3_app/models/menu_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

//menu page widgets..
class _MenuState extends State<Menu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Dashboard"),
    MenuModel(icon: 'assets/svg/bell.svg', title: "Notification"),
    MenuModel(icon: 'assets/svg/history.svg', title: "History"),
    MenuModel(icon: 'assets/svg/setting.svg', title: "Settings"),
    MenuModel(icon: 'assets/svg/profile.svg', title: "About Us"),
    MenuModel(icon: 'assets/svg/signout.svg', title: "Exit"),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[800]!,
              width: 1,
            ),
          ),
          color: const Color(0xFF171821)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            for (var i = 0; i < menu.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  color: selected == i
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = i;
                    });
                    widget.scaffoldKey.currentState!.closeDrawer();

                    // Navigate to the corresponding page
                    switch (i) {
                      case 0: // Dashboard
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => const MyApp()),
                        // );
                        break;
                      case 1:

                        break;
                      case 2:

                        break;
                      case 3:

                        break;
                      case 4:

                        break;
                      case 5:

                        break;
                      case 6:
                        break;
                      case 7:
                        SystemNavigator.pop();
                    }
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 7,
                        ),
                        child: SvgPicture.asset(
                          menu[i].icon,
                          color: selected == i ? Colors.white : Colors.white,
                        ),
                      ),
                      Text(
                        menu[i].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: selected == i ? Colors.white : Colors.white,
                            fontWeight: selected == i
                                ? FontWeight.w600
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }
}
