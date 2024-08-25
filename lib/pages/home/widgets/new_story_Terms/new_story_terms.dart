


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/models/story_model.dart';

import '../../../../utils/constants/size.dart';
import '../../controller/home_controller.dart';

class NewStoryTerms extends StatelessWidget {
  const NewStoryTerms({
    super.key,  this.count = 4, required this.story,
  });

  final int count ;
  final List<StoryModel> story ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: MySize.screenWidth,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index)=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220,
                width: MySize.screenWidth * 0.4,
                child: Image(image: AssetImage(story[index].image) ,fit: BoxFit.fill,),
              ),
               Text(
                 story[index].name ,
                 style: const TextStyle(color: Colors.white , fontSize: 21 , fontWeight: FontWeight.w300),)
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 15,),
          itemCount: count),
    );
  }
}