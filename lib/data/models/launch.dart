// ignore_for_file: avoid_dynamic_calls, sort_constructors_first,
// ignore_for_file: avoid_multiple_declarations_per_line

import 'package:space_x_launches/data/services/date_converter.dart';

///Class which has data about definitely launch
class Launch {
  ///Constructor
  Launch({
    required this.date,
    required this.time,
    required this.missionName,
    required this.launchSiteName,
    this.wikiPage,
  });

  ///Class fields
  String date, time, missionName, launchSiteName;
  ///Wikipedia page field
  String? wikiPage;

  ///Factory constructor for Launch class. Which converts json to class data
  factory Launch.fromJson(Map<String, dynamic> json){
    return Launch(
      date: SpaceXDateConverter.convertDate(json['launch_date_utc'] as String),
      time: SpaceXDateConverter.convertTime(json['launch_date_utc'] as String),
      missionName: json['mission_name'] as String,
      launchSiteName: json['launch_site']['site_name_long'] as String,
      wikiPage: json['links']['wikipedia'] as String?,
    );
  }
}
