import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCard extends StatelessWidget {
  final int id;
  final String title, type, name, imgURL;

  HomeCard(
      {super.key,
      required this.id,
      required this.title,
      required this.type,
      required this.name,
      required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/post?postid=$id'),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 360,
          maxHeight: 290,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                imgURL,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$type - $name',
                        style: TextStyle(
                          color: Color(0xff6C6C6C),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.turned_in_not,
                    ),
                    iconSize: 24,
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
