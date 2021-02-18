import 'package:url_launcher/url_launcher.dart';

import 'API/driver.Model.dart';

class Utils {
  static Future<void> makePhoneCall(String url) async {
    Driver driver;
    String phone = driver.phone.toString();

    url = "tel:" + phone;
    print(url);

    if (await canLaunch('tel:$url')) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
