import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(
          bottom:
              BorderSide(width: 1.0, color: Color.fromARGB(128, 137, 137, 137)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideBarItem(
              title: "Home",
              icons: Image.asset(
                "assets/icons/Home.png",
                width: 26,
                height: 26,
              ),
            ),
            SideBarItem(
              title: "Developer",
              icons: Image.asset(
                "assets/icons/developer.png",
                width: 26,
                height: 26,
              ),
            ),
            SideBarItem(
              title: "Desinger",
              icons: Image.asset(
                "assets/icons/desinger.png",
                width: 26,
                height: 26,
              ),
            ),
            SideBarItem(
              title: "Setting",
              icons: Image.asset(
                "assets/icons/setting.png",
                width: 26,
                height: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  final String title;
  final Image icons;
  SideBarItem({super.key, required this.title, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton.icon(
        style: TextButton.styleFrom(
            //<-- SEE HERE
            // side: BorderSide(width: 3.0),
            ),
        // <-- TextButton
        onPressed: () {},
        icon: icons,
        label: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
