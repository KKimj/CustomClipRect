import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomClipRectImage(),
    );
  }
}

class CustomClipRectImage extends StatefulWidget {
  const CustomClipRectImage({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomClipRectImage> createState() => _CustomClipRectImageState();
}

class _CustomClipRectImageState extends State<CustomClipRectImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomClipRectImage"),
      ),
      body: Center(
          child: ClipRect(
        // Input value
        clipper: CustomClipRect(left: 0, top: 0, right: 0, bottom: 0),
        child: Image.network(
            "https://media.istockphoto.com/photos/harvest-moon-picture-id157328796?k=20&m=157328796&s=612x612&w=0&h=yQXlTV_b2JgvkHNZ4ZKggWEwMMgUuE9K4YI_eTXrFh4="),
      )),
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
