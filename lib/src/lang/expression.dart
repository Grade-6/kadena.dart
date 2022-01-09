import 'dart:convert';

class Expression {
  final String name;
  final List<Object> arguments;

  const Expression(this.name, this.arguments);

  @override
  String toString() {
    return '($name ${arguments.map(json.encode).join(' ')})';
  }
}
