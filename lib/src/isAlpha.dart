RegExp _alpha = RegExp(r'^[a-zA-Z]+$');

/// check if the string [input] contains only letters (a-zA-Z).
bool isAlpha(String input) {
  return _alpha.hasMatch(input);
}
