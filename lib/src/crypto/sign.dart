import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';

import 'hash.dart';
import 'key_pair.dart';

class Signature {
  final String hash;
  final String sig;
  final String pubKey;

  const Signature(this.hash, this.sig, this.pubKey);

  @override
  String toString() => 'Signature { $hash, $sig, $pubKey }';
}

Signature sign(String message, KeyPair keyPair) {
  final _hashBin = hashBin(message);
  final _hash = base64Url.encode(_hashBin);
  final signature = keyPair.privateKey.sign(Uint8List.fromList(_hashBin));
  final signatureDetached = signature.take(64).toList();
  return Signature(_hash.replaceAll('=', ''),
      hex.encode(signatureDetached), hex.encode(keyPair.publicKey));
}
