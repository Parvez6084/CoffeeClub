import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Avatar extends StatelessWidget {
  final String imagePath;
  final double size;

  const Avatar({super.key, required this.imagePath, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.6),
        radius: size,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
