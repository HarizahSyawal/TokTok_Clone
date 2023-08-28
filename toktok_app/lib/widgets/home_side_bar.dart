import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/video.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({super.key, required this.video});
  final Video video;

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 13, color: Colors.white);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(widget.video.postedBy.profileImageUrl),
          _sideBarItem('heart', widget.video.likes, style),
          _sideBarItem('comment', widget.video.comments, style),
          _sideBarItem('share', 'Share', style),
          AnimatedBuilder(
              animation: _animationController,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/disc.png'),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://instagram.fkul3-4.fna.fbcdn.net/v/t51.2885-19/309338404_493944315918418_3470607335458966523_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fkul3-4.fna.fbcdn.net&_nc_cat=110&_nc_ohc=rs0lLZ3qzXwAX_-x-sL&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAHyzX1fALQzt5-1yPddzVM7DV2tyR_Vw-FyV0Ily3t4w&oe=64EE0B78&_nc_sid=8b3546'),
                  ),
                ],
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: 2 * pi * _animationController.value,
                  child: child,
                );
              })
        ],
      ),
    );
  }

  _sideBarItem(String iconName, String label, TextStyle style) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/$iconName.svg',
          color: Colors.white.withOpacity(0.75),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(label, style: style)
      ],
    );
  }

  _profileImageButton(String imageUrl) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(25)),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ))
      ],
    );
  }
}
