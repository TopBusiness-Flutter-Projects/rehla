import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rehla/core/widgets/my_svg_widget.dart';

class ListTailWidget extends StatelessWidget {
  const ListTailWidget(
      {Key? key,
      required this.title,
      required this.imagePath,
      })
      : super(key: key);
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 12),
      child: Row(
        children: [
          MySvgWidget(path: imagePath,width: 32,height: 32,),
          const SizedBox(width: 25,),
          Expanded(child: Align(alignment:lang=='en'?Alignment.centerLeft:Alignment.centerRight ,child: Text(title))),
        ],
      ),
    );
  }
}
