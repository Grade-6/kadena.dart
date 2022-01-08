import 'package:bip32_ed25519/bip32_ed25519.dart';
import 'package:convert/convert.dart' as convert;
import 'package:pinenacl/ed25519.dart';

class KeyPair {
  final SigningKey privateKey;

  const KeyPair._(this.privateKey);

  factory KeyPair.generate() => KeyPair._(SigningKey.generate());

  factory KeyPair.fromSeed(List<int> seed) {
    final key = SigningKey.fromSeed(Uint8List.fromList(seed));
    return KeyPair._(key);
  }

  //  This is not working correctly
  //
  // factory KeyPair.fromMnemonic(String mnemonic) {
  //   final entropy = bip39.mnemonicToEntropy(mnemonic.trim());
  //   print(entropy);
  //   final rawMaster = PBKDF2.hmac_sha512(
  //     Uint8List(0),
  //     Uint8List.fromList(convert.hex.decode(entropy)),
  //     4096,
  //     96,
  //   );
  //   final Bip32SigningKey rootXsk = Bip32SigningKey.normalizeBytes(rawMaster);
  //   print(rootXsk.take(32).toList());
  //   return KeyPair.fromSeed(rootXsk.take(32).toList());
  // }

  AsymmetricPublicKey get publicKey => privateKey.publicKey;

  @override
  String toString() =>
      'KeyPair{ ${convert.hex.encode(publicKey)}, ${convert.hex.encode(privateKey.seed)} }';
}
