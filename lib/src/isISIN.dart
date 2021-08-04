RegExp _regExp = RegExp(r"/^[A-Z]{2}[0-9A-Z]{9}[0-9]$/");

/// check if the string [input] is an ISIN
bool isISIN(String input) {
  if (!_regExp.hasMatch(input)) {
    return false;
  }
  var checksumStr = input.replaceAll(
      r"/[A-Z]/g",
      input.runes
          .map((chars) => int.parse(String.fromCharCode(chars)))
          .toString());

  var sum = 0;
  String digit;
  int tmpNum;
  bool shouldDouble = true;
  for (var i = checksumStr.length - 2; i >= 0; i--) {
    digit = checksumStr.substring(i, (i + 1));
    tmpNum = int.parse(digit, radix: 10);
    if (shouldDouble) {
      tmpNum *= 2;
      if (tmpNum >= 10) {
        sum += tmpNum + 1;
      } else {
        sum += tmpNum;
      }
    } else {
      sum += tmpNum;
    }
    shouldDouble = !shouldDouble;
  }

  return int.parse(input.substring(input.length - 1), radix: 10) ==
      (10000 - sum) % 10;
}
