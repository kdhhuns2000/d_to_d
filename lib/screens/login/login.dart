import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/login_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_developer.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontFamily: 'NotoSerifKR',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_designer.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Designer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontFamily: 'NotoSerifKR',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                LoginWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
