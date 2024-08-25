


import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../models/story_model.dart';

class StoryTeam extends StatelessWidget {
  const StoryTeam({
    super.key,
    required this.story,
  });

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('المؤلف: ${story.team.author}',
            style: const TextStyle(
                fontSize: 18,
                color: MyColors.grayColor),
            overflow: TextOverflow.visible),
        const SizedBox(
          height: MySize.spaceBetweenItems,
        ),
        Text('الرسام: ${story.team.drawer}',
            style: const TextStyle(
                fontSize: 18,
                color: MyColors.grayColor),
            overflow: TextOverflow.visible),
        const SizedBox(
          height: MySize.spaceBetweenItems,
        ),
        story.team.characterDesigner != ''
            ? Text(
            'مصمم الشخصيات: ${story.team.characterDesigner}',
            style: const TextStyle(
                fontSize: 16,
                color: MyColors.grayColor),
            overflow: TextOverflow.visible)
            : const SizedBox(),
      ],
    );
  }
}