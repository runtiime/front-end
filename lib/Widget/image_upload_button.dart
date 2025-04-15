import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUploadButton extends StatelessWidget {
  final VoidCallback onTap;
  final double containerWidth;
  final double imageWidth;
  final bool hasBorder;

  const ImageUploadButton({
    super.key,
    required this.onTap,
    required this.containerWidth,
    required this.imageWidth,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            border: hasBorder
                ? Border.all(color: const Color(0xFFE6B277), width: 1.5)
                : null,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Image.asset(
              'assets/image_icon.png',
              width: imageWidth,
              height: imageWidth,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
