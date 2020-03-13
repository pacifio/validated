import 'package:validated/validated.dart' as validate;

void main() {
  print(validate.isBoolean('a'));
  print(validate.isEmail("adib@gmail.com"));
  print(validate.isAscii("ABCDEF"));
  print(validate.isSameType('String', false));
  print(validate.isUpperCase("ADIB"));
  print(validate.isCapitalized("Adib"));
  print(validate.contains("Dart is nice", "nice"));
  print(validate.isCurrency("\$"));
  print(validate.isURL('https://www.google.com'));
  print(validate.isEmoji("😀"));
}
