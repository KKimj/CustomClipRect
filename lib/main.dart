import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomClipRectImage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomClipRectImage(),
    );
  }
}

class CustomClipRectImage extends StatelessWidget {
  const CustomClipRectImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const double width = 1920;
    // const double height = 1080;
    const double left = 300;
    const double top = 200;
    const double right = 400;
    const double bottom = 100;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("CustomClipRectImage"),
      ),
      body: Center(
        child: SizedOverflowBox(
          size: const Size(0, 0),
          child: ClipRect(
            // Input value
            clipper: const CustomClipRect(
                left: left, top: top, right: right, bottom: bottom),
            child: Image.network("https://wallpaperaccess.com/full/109666.jpg"),
          ),
        ),
      ),
    );
  }
}

class CustomClipRect extends CustomClipper<Rect> {
  const CustomClipRect(
      {required this.left,
      required this.top,
      required this.right,
      required this.bottom});
  final double left;
  final double top;
  final double right;
  final double bottom;
  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromPoints(
        Offset(left, top), Offset(size.width - right, size.height - bottom));
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    throw UnimplementedError();
  }
}
