import 'package:blog/components/cupertino_tap.dart';
import 'package:blog/components/custom_sliver_refresh.dart';
import 'package:blog/components/dec12_sliver_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dec26 extends StatelessWidget {
  const Dec26({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate:
                  Dec12SliverHeader(maxExtend: 100, title: "위로 당기면 나와요!")),
          // CupertinoSliverRefreshControl(
          //   refreshIndicatorExtent: 60,
          //   refreshTriggerPullDistance: 100,
          //   onRefresh: () {
          //     return Future.delayed(const Duration(milliseconds: 2000));
          //   },
          // ),
          CustomSliverRefreshControl(
              refreshIndicatorExtent: 60,
              refreshTriggerPullDistance: 100,
              onRefresh: () {
                return Future.delayed(const Duration(milliseconds: 3000));
              }),
          SliverList(
              delegate: SliverChildListDelegate(List.generate(
                  20,
                  (index) => ListItems(
                        title: "$index 번째 아이템",
                      ))))
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
