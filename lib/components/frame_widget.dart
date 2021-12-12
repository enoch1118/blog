import 'package:flutter/material.dart';

class FrameWidget extends StatelessWidget {
  final Widget child;
  final String title;

  const FrameWidget({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Positioned.fill(child: child), header(context)],
      ),
    );
  }

  Positioned header(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 60 + MediaQuery.of(context).padding.top,
        color: Colors.green[50],
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}

class ConstTopPadding extends StatelessWidget {
  const ConstTopPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top + 60,
    );
  }
}
