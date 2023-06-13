import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:space_x_launches/data/models/launch.dart';
import 'package:space_x_launches/data/models/rocket.dart';

///Main service working with SpaceX API, for getting data
///Inversion principle with abstract class not needed
///we have one way to this data
class SpaceXService {
  static const _apiLink = 'api.spacexdata.com';
  static const _apiMissionsPath = '/v3/launches';
  static const _apiRocketsPath = '/v3/rockets';

  ///List of rockets id for requests. Last repeat, because forth rocket bfr
  ///has not launches and we should to have 4 pages in app
  static List<Rocket> rocketsList = [];

  ///List for launches data
  static List<Launch> launchesList = [];

  ///Function for fetching rockets data from API
  dynamic fetchRockets() async {
    rocketsList.clear();
    final uri = Uri.https(_apiLink, _apiRocketsPath);
    final response = await http.get(uri);
    final data = jsonDecode(response.body) as List<dynamic>;
    for(var element = 0; element < data.length; element++){
      rocketsList.add(Rocket.fromJson(data[element] as Map<String, dynamic>));
    }

    return rocketsList;
  }

  ///Function for fetching data from API
  dynamic fetchLaunches(int index) async {
    launchesList.clear();
    final uri = Uri.https(_apiLink, _apiMissionsPath,
        {'rocket_id': rocketsList[index].rocketId},
    );
    final response = await http.get(uri);
    final data = jsonDecode(response.body) as List<dynamic>;
    for(var element = 0; element < data.length; element++){
      launchesList.add(Launch.fromJson(data[element] as Map<String, dynamic>));
    }

    return launchesList;
  }

}
