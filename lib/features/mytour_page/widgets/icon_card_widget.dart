import 'package:flutter/material.dart';
import 'package:rehla/core/utils/app_colors.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';

class IconCardWidget extends StatelessWidget {
  const IconCardWidget({Key? key, required this.imagePath, required this.title, required this.titleValue}) : super(key: key);
  final String imagePath;
  final String title;
  final String titleValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Row(
          children: [
            MySvgWidget(
              path: imagePath,
              width: 25,
              height: 25,
              color: AppColors.gray,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(title,style: TextStyle(color: AppColors.gray),),
                    Text(titleValue,style: TextStyle(color: AppColors.gray),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
