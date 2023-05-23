import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/login/login_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d_to_d/utils/provider/login_state_provider.dart';

class MobileLogin extends ConsumerWidget {
  const MobileLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginValue = ref.watch(loginStateProvider);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: loginValue ? 1.0 : 1.0,
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                        sigmaX: loginValue ? 5 : 0, sigmaY: loginValue ? 5 : 0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg_developer.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: double.infinity,
                      alignment: Alignment.bottomLeft,
                      child: loginValue == true
                          ? null
                          : Padding(
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
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                        sigmaX: loginValue ? 5 : 0, sigmaY: loginValue ? 5 : 0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg_designer.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: double.infinity,
                      alignment: Alignment.topRight,
                      child: loginValue == true
                          ? null
                          : Padding(
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
                  ),
                ),
              ],
            ),
          ),
          LoginWidget(),
        ],
      ),
    );
  }
}
