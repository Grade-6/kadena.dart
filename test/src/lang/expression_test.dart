import 'package:kadena/kadena.dart';
import 'package:test/test.dart';

void main() {
  test('expression', () {
    final expression = Expression('+', [2, 3]);
    expect(expression.toString(), '(+ 2 3)');
  });
}
