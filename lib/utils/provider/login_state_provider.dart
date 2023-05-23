import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateProvider = StateNotifierProvider<Login, bool>((ref) {
  return Login(ref);
});

class Login extends StateNotifier<bool> {
  Login(this.ref) : super(false);

  final Ref ref;

  void update() {
    state = !state;
  }
}
