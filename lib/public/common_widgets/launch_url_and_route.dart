// helper class (not a widget)
// to be called instead of url_launcher

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlAndRoute {
  static Future<void> launch(BuildContext context, String url) async {
    if (url.startsWith("route:")) {
      context.push(url.substring(6));
    } else {
      if (!url.startsWith("http") && !url.contains(":")) {
        await launchUrl(Uri.parse("https://$url"));
      } else {
        await launchUrl(Uri.parse(url));
      }
    }
  }
}
