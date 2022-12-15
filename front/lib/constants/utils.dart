import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._();

  static final Uri _url = Uri.parse('https://rultor.pro/login/github');

  static Future<void> launchLogin() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
