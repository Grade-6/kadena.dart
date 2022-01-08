import 'dart:convert';

import 'package:pinenacl/digests.dart';

List<int> hashBin(String message) {
  return Hash.blake2b(message, digestSize: 32);
}

String hash(String message) {
  final hash = hashBin(message);
  return base64Url.encode(hash).replaceAll('=', '');
}
