import 'package:flutter/material.dart';

class Dec12SliverHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: maxExtend,
      child: Stack(
        children: [
          Positioned(
              left: 20,
              top: 0,
              child: Container(
                  padding: EdgeInsets.only(bottom: shrinkOffset),
                  height: maxExtend,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                  ))),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: shrinkOffset > 0 ? 1 : 0,
            child: Container(
              color: Colors.green[50],
              height: maxExtend,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 20,
                    right: 20,
                    bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => maxExtend;

  final double maxExtend;
  final String title;

  Dec12SliverHeader({required this.maxExtend, required this.title});

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
