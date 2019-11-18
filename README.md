# Validated
 The ultimate dart + flutter string validators . This library 45 validators plus sanitizers . Check out the [docs](https://pub.dev/documentation/validated/latest/validated/validated-library.html) for all functions . You will find all the functions under ```validated``` package

# Example

## Validators
Example of some validators .. go to ```lib/src/``` to get the full list of validators or check out the [docs](https://pub.dev/documentation/validated/latest/validated/validated-library.html) for more info
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
  print(validate.isEmoji("😀")); // true
  print(validate.isEmoji("some random text")); // false
}
```

## Sanitizers
Example of some sanitizers
> [Credit](https://github.com/karan/validator.dart/blob/master/lib/src/sanitizer.dart)
```dart
import 'package:validated/validated.dart' as validate;

validate.toBoolean(str);
validate.toDate(str);
validate.toDouble(str);
validate.toFloat(str);
validate.toInt(str);
validate.toString(input);
```

 # Credits
1 . [validator.js](https://github.com/validatorjs/validator.js)
<br>
2 . [dart-validator](https://github.com/karan/validator.dart)
<br>
3 . [email-validator](https://github.com/manishsaraan/email-validator)
<br>
1. [emoji-regex](https://www.regextester.com/106421)

# Todos
- [x] Ported validator.js to dart
- [x] emoji validator
- [x] supports dart 2+ versions
- [x] tested for flutter
- [x] added docs
