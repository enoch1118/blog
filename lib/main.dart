import 'package:blog/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BlogPost());
}

class BlogPost extends StatefulWidget {
  const BlogPost({Key? key}) : super(key: key);

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> with WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _setStatusBar();
  }

  // 상태바의 색상을 바꿔줌
  void _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: WidgetsBinding.instance!.window.platformBrightness,
        statusBarIconBrightness:
            WidgetsBinding.instance!.window.platformBrightness ==
                    Brightness.dark
                ? Brightness.light
                : Brightness.dark));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
