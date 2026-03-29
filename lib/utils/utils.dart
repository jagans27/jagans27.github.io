import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchURL({
    required String url,
    String? subject,
    String? body,
  }) async {
    try {
      if (url.isEmpty) return;

      Uri uri;
      final isMail = subject != null || body != null;

      if (isMail) {
        // Pass subject/body as plain text — Uri will encode automatically
        uri = Uri(
          scheme: 'mailto',
          path: url,
          queryParameters: {
            if (subject != null) 'subject': subject,
            if (body != null) 'body': body,
          },
        );
        uri = Uri.parse(uri.toString().replaceAll('+', '%20'));
      } else {
        uri = Uri.parse(url);
      }

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: isMail
              ? LaunchMode.platformDefault
              : LaunchMode.externalApplication,
        );
      } else {
        debugPrint('Could not launch $uri');
      }
    } catch (ex) {
      ex.logError();
    }
  }
}
