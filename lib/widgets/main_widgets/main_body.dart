import 'package:d_to_d/widgets/main_widgets/main_card.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ResponsiveGridList(
        horizontalGridMargin: 20,
        verticalGridMargin: 20,
        minItemWidth: 300,
        children: List.generate(
          100,
          (index) => MainCard(
              id: index,
              title: "같이 코딩할 사람",
              type: "Designer",
              name: "류관곤",
              imgURL: ""),
        ),
      ),
    );
  }
}
