import 'package:test/test.dart';
import 'package:validated/validated.dart' as validate;

void main() {
  test('testing validators', () {
    expect(validate.isBoolean('true'), true);
    expect(validate.isEmail('not@email'), false);
  });
}
