import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

final baseUtilsProvider = Provider<BaseUtils>(
  (ref) => BaseUtils(),
);

class BaseUtils {
  // void launchURL(String? url) async {
  //   if (url != null) {
  //     final _url = Uri.parse(url);
  //     //  check that url can open in browser.
  //     if (await canLaunchUrl(_url)) {
  //       await launchUrl(_url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

  bool allowFileExtension(
    String file,
    List<String> allowFiles,
  ) {
    final _file = p.extension(file);
    return allowFiles.contains(_file);
  }

  String? enumToStringSnakeCase(enumValue) {
    if (enumValue == null) return null;

    String enumString = enumValue.toString().split('.')[1];
    return enumString
        .replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => '_${match.group(0)}',
        )
        .toLowerCase();
  }

  Future<bool> checkUrl(String? url) async {
    try {
      if (url == null) return false;

      final response = await http.head(Uri.parse(url));
      return (response.statusCode >= 200 && response.statusCode < 300);
    } catch (e) {
      return false;
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  String generateUUID() {
    const uuid = Uuid();

    return uuid.v4();
  }
}
