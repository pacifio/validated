RegExp _alphanumeric = new RegExp(r'^[a-zA-Z0-9]+$');

/// check if the string [input] contains only letters and numbers
bool isAlphanumeric(String input) {
  return _alphanumeric.hasMatch(input);
}
