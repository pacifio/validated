import 'package:test/test.dart';
import 'package:validated/validated.dart' as validate;

void main() {
  test('testing validators', () {
    expect(validate.isBoolean('true'), true);
    expect(validate.isEmail('not@email'), false);
    expect(validate.isURL("google.com"), true);
    expect(validate.isCPF("07835319071"), true);
    expect(validate.isCPF("12312312323"), false);
    expect(validate.isCNPJ("52330920000171"), true);
    expect(validate.isCNPJ("12312312312312"), false);
  });
}
