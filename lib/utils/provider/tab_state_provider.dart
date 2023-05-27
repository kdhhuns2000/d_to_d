import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TabPage {
  home,
  developer,
  addPost,
  designer,
  setting,
}

final tabStateProvider =
    StateNotifierProvider<TabModalState, TabPage>((ref) {
  return TabModalState(ref);
});

class TabModalState extends StateNotifier<TabPage> {
  TabModalState(this.ref) : super(TabPage.home);

  final Ref ref;

  void change(TabPage page) {
    state = page;
  }
}
