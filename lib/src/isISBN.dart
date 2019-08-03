// taken from https://github.com/karan/validator.dart/tree/master/lib/src

RegExp _isbn10Maybe = new RegExp(r'^(?:[0-9]{9}X|[0-9]{10})$');
RegExp _isbn13Maybe = new RegExp(r'^(?:[0-9]{13})$');

/// check if the string [input] is an ISBN (version 10 or 13)
bool isISBN(String input, [version]) {
  if (version == null) {
    return isISBN(input, '10') || isISBN(input, '13');
  }

  version = version.toString();

  String sanitized = input.replaceAll(new RegExp(r'[\s-]+'), '');
  int checksum = 0;

  if (version == '10') {
    if (!_isbn10Maybe.hasMatch(sanitized)) {
      return false;
    }
    for (int i = 0; i < 9; i++) {
      checksum += (i + 1) * int.parse(sanitized[i]);
    }
    if (sanitized[9] == 'X') {
      checksum += 10 * 10;
    } else {
      checksum += 10 * int.parse(sanitized[9]);
    }
    return (checksum % 11 == 0);
  } else if (version == '13') {
    if (!_isbn13Maybe.hasMatch(sanitized)) {
      return false;
    }
    var factor = [1, 3];
    for (int i = 0; i < 12; i++) {
      checksum += factor[i % 2] * int.parse(sanitized[i]);
    }
    return (int.parse(sanitized[12]) - ((10 - (checksum % 10)) % 10) == 0);
  }

  return false;
}
