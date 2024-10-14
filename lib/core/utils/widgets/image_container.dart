import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const ImageContainer({
    super.key,
    required this.path,
    this.width = 24,
    this.height = 24,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      width: width,
      fit: fit,
      image: AssetImage(
        path,
      ),
    );
  }
}
