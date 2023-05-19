import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopLoginButton extends StatelessWidget {
  final String location;

  const DesktopLoginButton({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        child: ElevatedButton(
          onPressed: () => {context.go(location)},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16.0),
              backgroundColor: Colors.transparent,
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0))),
          child: Text(
            location,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
