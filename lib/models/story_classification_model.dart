
class StoryClassificationModel {
  final List<String> classification;
  final String image;

  StoryClassificationModel({required this.classification, required this.image});

  factory StoryClassificationModel.fromJson(Map<String, dynamic> json) {
    return StoryClassificationModel(
      classification: json['classification'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'classification': classification,
      'image': image,
    };
  }




}

