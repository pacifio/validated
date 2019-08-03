RegExp _regExp = RegExp(r"/^[0-9A-F]+$/i");

/// check if the string  [input] is a hexadecimal number
bool isHexadecimal(String input) {
  return _regExp.hasMatch(input);
}
