import 'package:get/get.dart';

class StoryDetailsController extends GetxController {
  final RxBool isFav = false.obs;
  List<String> tab = ['الفصول', 'الوصف', 'المؤلفون', 'مقترحة'];

  void addToFav() {
    isFav.value = !isFav.value;
  }
}

