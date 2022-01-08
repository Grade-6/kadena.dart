import 'package:convert/convert.dart' as convert;
import 'package:kadena/kadena.dart';

void main(List<String> arguments) {
  // final keyPair = KeyPair.generate();
  // print(convert.hex.encode(keyPair.publicKey));

  final secretKey =
      '53d1e1639bd6c607d33f3efcbaafc6d0d4fb022cd57a3a9b8534ddcd8c471902';
  final keyPairFromSeed = KeyPair.fromSeed(convert.hex.decode(secretKey));
  print(convert.hex.encode(keyPairFromSeed.publicKey) ==
      '85bef77ea3570387cac57da34938f246c7460dc533a67823f065823e327b2afd');

  // snack remind zero six want wild chunk wagon digital clinic scrub range
  // final keyPairFromMnemonic = KeyPair.fromMnemonic(
  //     'snack remind zero six want wild chunk wagon digital clinic scrub range');
  // final publicKey =
  //     '3519d5b19fc5859246237390196d3ace017fcd7e9d2b89125e9690b7b3519766';
  // print(keyPairFromMnemonic);
  // print(convert.hex.encode(keyPairFromMnemonic.publicKey) == publicKey);
}
