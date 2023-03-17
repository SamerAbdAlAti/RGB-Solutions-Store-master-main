import 'package:url_launcher/url_launcher_string.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    print("###############################$latitude");
    print("###############################$longitude");
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$longitude,$latitude';
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
