import 'package:blog/components/cupertino_tap.dart';
import 'package:blog/components/dec12_sliver_header.dart';
import 'package:flutter/material.dart';

class Dec12 extends StatelessWidget {
  const Dec12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: Dec12SliverHeader(
                  title: "12월12일포스팅",
                  maxExtend: MediaQuery.of(context).padding.top + 60)),
          SliverToBoxAdapter(
            child: Column(children: [
              CupertinoTap(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("뒤로가기")),
              ...List.generate(
                  40,
                  (index) => const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("아이템"),
                      )),
            ]),
          )
        ],
      ),
    );
  }
}
