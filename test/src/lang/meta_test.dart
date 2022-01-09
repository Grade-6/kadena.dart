import 'package:kadena/src/lang/meta.dart';
import 'package:test/test.dart';

void main() {
  test('meta', () {
    final expression = Meta('Bob', '4', 0.00001, 10000, 1570133940, 28800);
    final data = expression.toMap();
    expect(data['sender'], 'Bob');
    expect(data['chainId'], '4');
    expect(data['gasPrice'], 0.00001);
    expect(data['gasLimit'], 10000);
    expect(data['creationTime'], 1570133940);
    expect(data['ttl'], 28800);
  });
}
