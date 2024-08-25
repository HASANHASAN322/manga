import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/models/story_classification_model.dart';
import 'package:manga/models/story_model.dart';
import 'package:manga/models/team_model.dart';
import 'package:manga/utils/constants/images_string.dart';

class HomeController extends GetxController {


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxBool notifyMe = false.obs ;


  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    update();
  }

  List<String> banners = [
    MyImages.male1,
    MyImages.male2,
    MyImages.girl2,
    MyImages.girl1,
  ];

  List<String> storyClasses = [
   'دراما',
    'أكشن',
   'كوميديا',
     'خيال',
   'مغامرة',
    'غموض',
    'تعليمي',
    'خيال علمي',
   'مثير',
    'رعب',
  ];

  List<StoryModel> story = [
    StoryModel(
        id: '1',
        name: 'story 1',
        classification: StoryClassificationModel(classification: ['أكشن' , 'مغامرة' ], image: MyImages.male1),
        image: MyImages.male1,
        desc: 'desc for story 1 ,',
        team: TeamModel(author: 'مؤلف القصة 1', drawer: 'رسام القصة 1'),
        rating: '4',
        date: DateTime.now()),
    StoryModel(
        id: '2',
        name: 'story 2',
        classification: StoryClassificationModel(classification: ['رعب'], image: MyImages.male1),
        image: MyImages.male2,
        desc: 'desc for story 2 ,',
        team: TeamModel(author: 'مؤلف القصة 2', drawer: 'رسام القصة 2'),
        rating: '4',
        date: DateTime.now()),
    StoryModel(
        id: '3',
        name: 'story 3',
        classification: StoryClassificationModel(classification: ['أكشن' , 'مغامرة'], image: MyImages.male1),
        image: MyImages.girl1,
        desc: 'desc for story 3 ,',
        rating: '4.5',
        team: TeamModel(author: 'مؤلف القصة 3', drawer: 'رسام القصة 3'),
        date: DateTime.now()),
    StoryModel(
        id: '4',
        name: 'story 4',
        classification: StoryClassificationModel(classification: ['مثير'], image: MyImages.male1),
        image: MyImages.girl2,
        desc: 'desc for story 4 ,',
        rating: '3.7',
        team: TeamModel(author: 'مؤلف القصة 4', drawer: 'رسام القصة 4'),
        date: DateTime.now()),
  ];


  final currentIndex = 0.obs;

  void updatePageIndicator(index) {
    currentIndex.value = index;
  }
}


//{'name': , 'desc': 'desc for one' , 'image' : MyImages.male1},
//     {'name': 'story 2', 'desc': 'desc for 2', 'image' : MyImages.male2} ,
//     {'name': 'story 3', 'desc': 'desc for 3', 'image' : MyImages.girl1} ,
//     {'name': 'story 4', 'desc': 'desc for 4', 'image' : MyImages.girl2}