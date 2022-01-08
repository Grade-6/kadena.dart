import 'dart:convert';

import 'package:pinenacl/digests.dart';

String hash(String message) {
  final hash = Hash.blake2b(message, digestSize: 32);
  return base64Url.encode(hash).replaceAll('=', '');
}
