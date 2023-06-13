// ignore_for_file: avoid_multiple_declarations_per_line, sort_constructors_first, avoid_dynamic_calls, lines_longer_than_80_chars

///Class which has data about Rocket
class Rocket {
  ///Constructor
  const Rocket({
    required this.rocketId,
    required this.image,
  });
  ///Class fields
  final String rocketId, image;

  ///Factory constructor for Rocket class
  ///Which converts json to class data
  factory Rocket.fromJson(Map<String, dynamic> json){
    return Rocket(
        rocketId: json['rocket_id'] as String,
        image: json['flickr_images'][0] as String,
    );
  }
}
