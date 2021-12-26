import 'package:blog/components/cupertino_tap.dart';
import 'package:blog/components/frame_widget.dart';
import 'package:blog/util/custom_route.dart';
import 'package:blog/views/post/dec20.dart';
import 'package:blog/views/post/dec26.dart';
import 'package:blog/views/post/dec7.dart';
import 'package:flutter/material.dart';

typedef RouteF = Widget Function(BuildContext context);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      title: "HOME",
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ConstTopPadding(),
            ...List.generate(
                items.length,
                (index) => HomeItems(
                      title: items[index]["title"] as String,
                      to: (context) => items[index]["tap"] as Widget,
                    )),
          ],
        ),
      ),
    );
  }
}

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key, required this.title, required this.to})
      : super(key: key);
  final String title;
  final RouteF to;
  @override
  Widget build(BuildContext context) {
    return CupertinoTap(
      onTap: () {
        Navigator.of(context).push(CustomRoute(builder: to));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              color: Theme.of(context).shadowColor.withOpacity(.1),
              blurRadius: .1)
        ]),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

final items = [
  {"title": "2021년 12월 7일 포스트", "tap": const Dec12()},
  {"title": "2021년 12월 20일 포스트", "tap": const Dec20()},
  {"title": "2021년 12월 26일 포스트", "tap": const Dec26()}
];
