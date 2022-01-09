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

  String get hashWithoutPadding => hash.replaceAll('=', '');

  @override
  String toString() => 'Signature { $hash, $sig, $pubKey }';
}

Signature signHash(String hash, KeyPair keyPair) {
  final _hash = base64Url.decode(hash);
  final signature = keyPair.privateKey.sign(Uint8List.fromList(_hash));
  final signatureDetached = signature.take(64).toList();
  return Signature(
      hash, hex.encode(signatureDetached), hex.encode(keyPair.publicKey));
}

Signature sign(String message, KeyPair keyPair) {
  final _hashBin = hashBin(message);
  final _hash = base64Url.encode(_hashBin);
  return signHash(_hash, keyPair);
}
