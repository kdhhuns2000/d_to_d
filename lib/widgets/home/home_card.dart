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

  String testSrc =
      "data:image/jpeg;base64,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";

  // Image.network("")

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/post'),
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
            Image.network(
              testSrc,
              fit: BoxFit.cover,
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
