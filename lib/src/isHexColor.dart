RegExp _regExp = RegExp(r"/^#?([0-9A-F]{3}|[0-9A-F]{6})$/i");

/// check if the string [input] is a hexadecimal color
bool isHexColor(String input) {
  return _regExp.hasMatch(input);
}
