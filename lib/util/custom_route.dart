import 'package:flutter/material.dart';

class CustomRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  //builder 는 위젯빌더 settings는 네임드 라우트에서 argument를 사용할때 필요!!
  CustomRoute({required this.builder, RouteSettings? settings})
      : super(settings: settings);

  //일단 간단하게 투명배경!
  @override
  Color? get barrierColor => Colors.transparent;

  //배리어에 접근성추가, 이부분을 인식해서 시각장애인분들이 터시시에 tts가 읽어주는 역활을 합니다
  @override
  String? get barrierLabel => "페이지 이동중";

  //얘는 잘모르니 패스!
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  //애는 추가! 왼쪽으로 이동하는 라우트 애니메이션을 만들었습니다!
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .chain(CurveTween(curve: Curves.easeInOut))
                .animate(animation),
        child: child);
  }

  //이전 페이지에서 future를 사용해서 다음페이지에서 resolve를 해야할때 true! 딱히 사용할데는 모르겠습니다
  @override
  bool get maintainState => false;

  //페이지 이동 시간
  //저는 300ms!
  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
