import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads =
      "$kBaseUrl/trending/all/day?api_key=$apiKey";
}
