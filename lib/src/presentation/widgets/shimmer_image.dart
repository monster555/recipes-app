import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatefulWidget {
  final String image;
  final BoxFit fit;
  final double height;
  final double width;

  const ShimmerImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    this.fit = BoxFit.cover,
  });

  @override
  State<ShimmerImage> createState() => _ShimmerImageState();
}

class _ShimmerImageState extends State<ShimmerImage> {
  // Declare our ready flag
  bool ready = false;

  // Declare our network image
  late NetworkImage networkImage;

  // Update our ready flag when the image is loaded
  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    if (!mounted) return;
    setState(() => ready = true);
  }

  @override
  void initState() {
    // Initialize our network image
    networkImage = NetworkImage(widget.image);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add our listener to the image stream
      ImageStream imageStream =
          networkImage.resolve(createLocalImageConfiguration(context));
      // Create our listener and add it to the stream
      final ImageStreamListener listener = ImageStreamListener(_updateImage);
      imageStream.addListener(listener);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 50),
          firstChild: SizedBox(
            height: widget.height,
            width: widget.width,
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.outline.withOpacity(.1),
              highlightColor:
                  Theme.of(context).colorScheme.outline.withOpacity(.3),
              child: Container(
                height: widget.height,
                width: widget.width,
                color: Colors.white,
              ),
            ),
          ),
          secondChild: FadeInImage(
            image: networkImage,
            fadeOutDuration: const Duration(milliseconds: 10),
            placeholder: MemoryImage(kTransparentImage),
            fit: widget.fit,
            height: widget.height,
            width: widget.width,
          ),
          crossFadeState:
              !ready ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ],
    );
  }
}

// This is the transparent image used in the FadeInImage as placeholder
final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
