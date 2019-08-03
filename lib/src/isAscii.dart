RegExp _ascii_regex = new RegExp(r"/^[\x00-\x7F]+$/");

/// check if the string contains ASCII chars only
bool isAscii(String input) {
  return _ascii_regex.hasMatch(input);
}
