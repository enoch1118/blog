import 'package:flutter/cupertino.dart';

typedef VoidF = void Function();

class CupertinoTap extends StatelessWidget {
  const CupertinoTap({Key? key, required this.onTap, required this.child})
      : super(key: key);
  final VoidF onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onTap,
      child: child,
    );
  }
}
