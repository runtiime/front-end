import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUploadButton extends StatefulWidget {
  final double containerWidth;
  final double imageWidth;
  final bool hasBorder;
  final void Function(File)? onImageSelected;

  const ImageUploadButton({
    super.key,
    required this.containerWidth,
    required this.imageWidth,
    this.hasBorder = true,
    this.onImageSelected,
  });

  @override
  State<ImageUploadButton> createState() => _ImageUploadButtonState();
}

class _ImageUploadButtonState extends State<ImageUploadButton> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _handleTap() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        _selectedImage = file;
      });
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(file); // 콜백 호출
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: widget.containerWidth,
          height: widget.containerWidth,
          decoration: BoxDecoration(
            border: widget.hasBorder
                ? Border.all(color: const Color(0xFFE6B277), width: 1.5)
                : null,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: _selectedImage == null
                ? Image.asset(
              'assets/image_icon.png',
              width: widget.imageWidth,
              height: widget.imageWidth,
              fit: BoxFit.contain,
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.file(
                _selectedImage!,
                width: widget.containerWidth,
                height: widget.containerWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
