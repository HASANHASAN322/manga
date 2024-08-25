


import 'package:flutter/material.dart';
import 'package:manga/utils/constants/text_string.dart';

import '../constants/colors.dart';

class HeaderWidget extends StatelessWidget {
   const HeaderWidget({
    super.key,
    required this.label,
    this.showBtn = true,  this.onTap,
  });
  final String label;
  final bool showBtn;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        showBtn
            ? TextButton(
            onPressed:onTap,
            child: const Text(
             MyText.showAll,
              style: TextStyle(color: MyColors.mainColor, fontSize: 18),
            ))
            : const Text('')
      ],
    );
  }
}