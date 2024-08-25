import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/story_classification_model.dart';
import '../../../models/story_model.dart';
import '../../../models/team_model.dart';
import '../../../utils/constants/images_string.dart';


class ClassificationController extends GetxController {

  final RxBool isFav = false.obs;

  void addToFav() {
    isFav.value = !isFav.value;
  }

  List<StoryModel> story = [
    StoryModel(
        id: '1',
        name: 'story 1',
        classification: StoryClassificationModel(
            classification: ['أكشن', 'مغامرة'], image: MyImages.male1),
        image: MyImages.male1,
        desc: 'desc for story 1 ,',
        team: TeamModel(author: 'مؤلف القصة 1', drawer: 'رسام القصة 1'),
        rating: '4',
        date: DateTime.now()),
    StoryModel(
        id: '2',
        name: 'story 2',
        classification: StoryClassificationModel(
            classification: ['رعب'], image: MyImages.male1),
        image: MyImages.male2,
        desc: 'desc for story 2 ,',
        team: TeamModel(author: 'مؤلف القصة 2', drawer: 'رسام القصة 2'),
        rating: '4',
        date: DateTime.now()),
    StoryModel(
        id: '3',
        name: 'story 3',
        classification: StoryClassificationModel(
            classification: ['أكشن', 'مغامرة'], image: MyImages.male1),
        image: MyImages.girl1,
        desc: 'desc for story 3 ,',
        rating: '4.5',
        team: TeamModel(author: 'مؤلف القصة 3', drawer: 'رسام القصة 3'),
        date: DateTime.now()),
    StoryModel(
        id: '4',
        name: 'story 4',
        classification: StoryClassificationModel(
            classification: ['مثير'], image: MyImages.male1),
        image: MyImages.girl2,
        desc: 'desc for story 4 ,',
        rating: '3.7',
        team: TeamModel(author: 'مؤلف القصة 4', drawer: 'رسام القصة 4'),
        date: DateTime.now()),
  ];

  List<String> tab = ['الاحدث', 'أفضل تصنيف', 'قريبا'];
  List<Widget> body = [
      ];
}
