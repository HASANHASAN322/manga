import 'package:manga/models/story_classification_model.dart';
import 'package:manga/models/team_model.dart';


/// edit this to add terms


class StoryModel {
  final String id;
  final String name;
  final StoryClassificationModel classification;
  final String image;
  final String? rating;
  final String desc;
  final TeamModel team;
  final DateTime date;

  StoryModel(
      {required this.id,
      required this.name,
      required this.classification,
      required this.image,
      required this.desc,
      required this.team,
      required this.date,
         this.rating = '0' });


  /// to json
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'Date': date,
      'Classification': classification.toJson(),
      'Desc': desc,
      'Team': team,
      'Rating': rating,
    };
  }

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['Id'],
      name: json['Name'],
      classification: StoryClassificationModel.fromJson(json['Classification']),
      image: json['Image'],
      desc: json['Desc'],
      team: TeamModel.fromJson(json['Team']),
      date: DateTime.parse(json['Date']),
      rating : json['Rating']
    );
  }


}
