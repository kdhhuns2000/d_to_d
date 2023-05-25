import 'package:d_to_d/utils/api/service.dart';
import 'package:d_to_d/widgets/home/home_card.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:d_to_d/models/post.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _controller = ScrollController();

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
            return ResponsiveGridListBuilder(
              horizontalGridMargin: 20,
              verticalGridMargin: 20,
              minItemWidth: 300,
              gridItems: List.generate(
                posts.length,
                (index) => HomeCard(
                  id: posts[index].id,
                  title: posts[index].title,
                  type: posts[index].category,
                  name: posts[index].writer,
                  imgURL: posts[index].image,
                ),
              ),
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
              // builder: (context, items) => ,
              // children: List.generate(
              //   posts.length,
              //   (index) => HomeCard(
              //     id: posts[index].id,
              //     title: posts[index].title,
              //     type: posts[index].category,
              //     name: posts[index].writer,
              //     imgURL: posts[index].image,
              //   ),
              // ),
            );
          }
        },
        // child: ResponsiveGridList(
        //   horizontalGridMargin: 20,
        //   verticalGridMargin: 20,
        //   minItemWidth: 300,
        //   children: List.generate(
        //     100,
        //     (index) => HomeCard(
        //         id: index,
        //         title: "같이 코딩할 사람",
        //         type: "Designer",
        //         name: "류관곤",
        //         imgURL: ""),
        //   ),
        // ),
      ),
    );
  }
}
