RegExp _regExp = RegExp(r"/^[A-Z2-7]+=*$/");

/// check if a string [input] is base32 encoded
bool isBase32(String input) {
  if (input.toString().length > 0 &&
      input.toString().length % 8 == 0 &&
      _regExp.hasMatch(input)) {
    return true;
  } else {
    return false;
  }
}
