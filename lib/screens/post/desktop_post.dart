import 'package:flutter/material.dart';

class DesktopPost extends StatefulWidget {
  const DesktopPost({super.key});
  @override
  State<DesktopPost> createState() => _DesktopPostState();
}

class _DesktopPostState extends State<DesktopPost> {
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          right: mediaWidth * 0.05,
          left: mediaWidth * 0.05,
          top: mediaHeight * 0.05,
          bottom: mediaHeight * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start, // 이미지 상단 정렬
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 27.0),
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Image.asset(
                          'assets/images/img_setting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: mediaWidth * 0.05), // 가운데 간격

              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            '제목',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0, bottom: 20.0),
                          child: Text('하하하 개발자 - 이승민',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              '내용\n내용\n내용\n내용\n내용\n내용',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 4.0,
                            right: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.red,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'CONNECT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0), // 가운데 간격

          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
