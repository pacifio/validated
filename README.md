# Validated
 The ultimate dart + flutter string validators . This library over 40 validators plus sanitizers . Check out the [docs](https://pub.dev/documentation/validated/latest/) for all functions . You will find all the functions under ```validated``` package

# Example
```dart
import 'package:validated/validated.dart' as validate;

void main() {
  print(validate.isBoolean('a')); // false
  print(validate.isEmail("adib@gmail.com")); // true
  print(validate.isAscii("ABCDEF")); // false
  print(validate.isSameType('String', false)); // false
  print(validate.isUpperCase("ADIB")); // true
  print(validate.isCapital("Adib")); // true
  print(validate.contains("Dart is nice", "nice")); // true
  print(validate.isCurrency("\$")); // false
  print(validate.isURL('https://www.google.com')); // true
}
```

 # Credits
1 . [validator.js](https://github.com/validatorjs/validator.js)
<br/>
2 . [dart-validator](https://github.com/karan/validator.dart)
<br/>
3 . [email-validator](https://github.com/manishsaraan/email-validator)
<br/>

# Todos
- [x] Ported validator.js to dart
- [ ] emoji validator
- [x] supports dart 2+ versions
- [x] tested for flutter
- [x] added docs
