import 'package:blog/components/cupertino_tap.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Dec20 extends StatelessWidget {
  const Dec20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "12월 20일포스트",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: RiveAnimation.asset('assets/riv/check.riv',
                  stateMachines: ["checkState"], onInit: (_) {}),
            ),
            CupertinoTap(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "뒤로가기",
                  style: Theme.of(context).textTheme.bodyText1,
                ))
          ],
        ),
      ),
    );
  }
}
