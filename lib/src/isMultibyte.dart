RegExp _multibyte = RegExp(r'[^\x00-\x7F]');

/// check if the string contains one or more multibyte chars
bool isMultibyte(String input) {
  return _multibyte.hasMatch(input);
}
