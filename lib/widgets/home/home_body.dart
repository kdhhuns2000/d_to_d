import 'package:d_to_d/utils/api/service.dart';
import 'package:d_to_d/widgets/home/home_card.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:d_to_d/models/post.dart';
import 'package:flutter/material.dart';

enum Filter {
  developer,
  designer,
}

class HomeBody extends StatefulWidget {
  final Filter? filter;

  const HomeBody({super.key, this.filter});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: Service.getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData | snapshot.hasError) {
            return CircularProgressIndicator();
          } else {
            List<Post> posts = snapshot.data!;
            List<Widget> gridItems = List.empty(growable: true);
            for (var post in posts) {
              if (widget.filter == Filter.developer) {
                if (post.category != 'developer') {
                  continue;
                }
              } else if (widget.filter == Filter.designer) {
                if (post.category != 'designer') {
                  continue;
                }
              }
              gridItems.add(HomeCard(
                id: post.id,
                title: post.title,
                type: post.category,
                name: post.writer,
                imgURL: post.image,
              ));
            }
            return ResponsiveGridListBuilder(
              horizontalGridMargin: 20,
              verticalGridMargin: 20,
              minItemWidth: 300,
              gridItems: gridItems,
              builder: (context, items) {
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {});
                  },
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    children: items,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
