import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExampleItem {
  final String title;

  ExampleItem({
    required this.title,
  });
}

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _HomeSearchBarState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Row(
        children: [
          SizedBox(
              width: 600,
              height: 35,
              child: TextField(
                cursorWidth: 1,
                cursorHeight: 14,
                cursorColor: Colors.black,
                focusNode: focusNode,
                style: TextStyle(fontSize: 14),
                // autofocus: true,
                controller: _filter,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFC6C6C6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    width: 60,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  // hintText: '검색',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(128, 137, 137, 137),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(128, 137, 137, 137),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(128, 137, 137, 137),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
              )),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              context.go('/addpost');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(18),
              ),
              width: 80,
              height: 35,
              child: Center(
                child: Text(
                  '글쓰기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
