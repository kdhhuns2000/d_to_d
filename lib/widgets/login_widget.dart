import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  backgroundColor: Colors.transparent,
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
