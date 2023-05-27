import 'package:d_to_d/utils/provider/tab_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = ref.watch(tabStateProvider);
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
              icons: tabState != TabPage.home
                  ? Image.asset(
                      'assets/icons/home_FILL0.png',
                      width: 26,
                      height: 26,
                    )
                  : Image.asset(
                      'assets/icons/home_FILL1.png',
                      width: 26,
                      height: 26,
                    ),
            ),
            SideBarItem(
              title: "Developer",
              icons: tabState != TabPage.developer
                  ? Image.asset(
                      'assets/icons/desktop_windows_FILL0.png',
                      width: 26,
                      height: 26,
                    )
                  : Image.asset(
                      'assets/icons/desktop_windows_FILL1.png',
                      width: 26,
                      height: 26,
                    ),
            ),
            SideBarItem(
              title: "Designer",
              icons: tabState != TabPage.designer
                  ? Image.asset(
                      'assets/icons/palette_FILL0.png',
                      width: 26,
                      height: 26,
                    )
                  : Image.asset(
                      'assets/icons/palette_FILL1.png',
                      width: 26,
                      height: 26,
                    ),
            ),
            SideBarItem(
              title: "Setting",
              icons: tabState != TabPage.setting
                  ? Image.asset(
                      'assets/icons/settings_FILL0.png',
                      width: 26,
                      height: 26,
                    )
                  : Image.asset(
                      'assets/icons/settings_FILL1.png',
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

class SideBarItem extends ConsumerWidget {
  final String title;
  final Image icons;
  SideBarItem({super.key, required this.title, required this.icons});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton.icon(
        style: TextButton.styleFrom(
            //<-- SEE HERE
            // side: BorderSide(width: 3.0),
            ),
        // <-- TextButton
        onPressed: () {
          switch (title) {
            case "Home":
              ref.read(tabStateProvider.notifier).change(TabPage.home);
              context.go("/home");
              break;
            case "Developer":
              ref.read(tabStateProvider.notifier).change(TabPage.developer);
              context.go('/developer');
              break;
            case "Designer":
              ref.read(tabStateProvider.notifier).change(TabPage.designer);
              context.go('/designer');
              break;
            case "Setting":
              ref.read(tabStateProvider.notifier).change(TabPage.setting);
              context.go('/setting');
              break;
          }
        },
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
