import 'package:flutter/material.dart';

import '../widgets/home_side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFollowingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isFollowingSelected = true;
                  })
                },
                child: Text(
                  "Following",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: _isFollowingSelected ? 18 : 15,
                      color: _isFollowingSelected ? Colors.white : Colors.grey),
                ),
              ),
              Text(
                "   |   ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15, color: Colors.grey),
              ),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isFollowingSelected = false;
                  })
                },
                child: Text(
                  "For you",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: !_isFollowingSelected ? 18 : 15,
                      color:
                          !_isFollowingSelected ? Colors.white : Colors.grey),
                ),
              )
            ],
          ),
        ),
        body: PageView.builder(
            onPageChanged: (int page) => {},
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    color: Colors.amber,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.purple,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.75,
                          color: Colors.pink,
                          child: HomeSideBar(),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}
