import 'dart:convert';

extension ReAddPadding on Base64Codec {
  String fixPadding(String string) {
    try {
      base64.decode(string);
      return string;
    } catch (_) {
      return fixPadding('$string=');
    }
  }
}
