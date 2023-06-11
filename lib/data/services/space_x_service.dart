import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:space_x_launches/data/models/launch.dart';

///Main service working with SpaceX API, for getting data
///Inversion principle with abstract class not needed
///we have one way to this data
class SpaceXService {
  static const _apiLink = 'api.spacexdata.com';
  static const _apiPath = '/v3/launches';

  ///List of rockets id for requests. Last repeat, because forth rocket bfr
  ///has not launches and we should to have 4 pages in app
  static const rocketsList = ['falcon1', 'falcon9', 'falconheavy', 'falcon1'];

  ///List for launches data
  List<Launch> launchesList = [];


  ///Function for fetching data from API
  dynamic fetchMissions(int index) async {
    launchesList.clear();
    final uri = Uri.https(_apiLink, _apiPath,
        {'rocket_id': rocketsList[index]},
    );
    final response = await http.get(uri);
    final data = jsonDecode(response.body) as List<dynamic>;
    for(var element = 0; element < data.length; element++){
      launchesList.add(Launch.fromJson(data[element] as Map<String, dynamic>));
    }

    return launchesList;
  }

}
