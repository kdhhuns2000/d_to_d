import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginModalStateProvider = StateNotifierProvider<LoginModalState, bool>((ref) {
  return LoginModalState(ref);
});

class LoginModalState extends StateNotifier<bool> {
  LoginModalState(this.ref) : super(false);

  final Ref ref;

  void update() {
    state = !state;
  }
}
