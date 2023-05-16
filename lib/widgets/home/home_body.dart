import 'package:d_to_d/widgets/home/home_card.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
          (index) => HomeCard(
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
