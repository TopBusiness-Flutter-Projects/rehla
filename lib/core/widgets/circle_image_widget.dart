import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({Key? key,  required this.width, required this.height, this.path})
      : super(key: key);

  final double width;
  final double height;
  final String? path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8.0),
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3),

        image: DecorationImage(
            image: AssetImage(path ??ImageAssets.avatar),
            fit: BoxFit.cover),
      ),
    );
  }
}
