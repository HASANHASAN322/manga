


import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class StoryDisc extends StatelessWidget {
  const StoryDisc({
    super.key,
    required this.storyDisc,
  });

  final String storyDisc;

  @override
  Widget build(BuildContext context) {
    return Text(storyDisc,
        style: const TextStyle(
            fontSize: 16,
            color: MyColors.grayColor),
        overflow: TextOverflow.visible);
  }
}