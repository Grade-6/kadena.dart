import 'package:convert/convert.dart';
import 'package:kadena/kadena.dart';
import 'package:test/test.dart';

void main() {
  test('fromSeed', () {
    final secretKey =
        '53d1e1639bd6c607d33f3efcbaafc6d0d4fb022cd57a3a9b8534ddcd8c471902';
    final keyPair = KeyPair.fromSeed(hex.decode(secretKey));
    expect(hex.encode(keyPair.publicKey),
        '85bef77ea3570387cac57da34938f246c7460dc533a67823f065823e327b2afd');
    expect(hex.encode(keyPair.privateKey.seed),
        '53d1e1639bd6c607d33f3efcbaafc6d0d4fb022cd57a3a9b8534ddcd8c471902');
  });
}
