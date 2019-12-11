RegExp _regExp = RegExp(
    r"/[\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]/");

/// check if the string contains any half-width chars
bool isHalfWidth(String input) {
  return _regExp.hasMatch(input);
}
