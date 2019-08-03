RegExp _regExp = new RegExp(r"/[^A-Z0-9+\/=]/i");

/// check if a string [input] is base64 encoded
bool isBase64(String input) {
  if (input != null && input.length % 4 != 0 || _regExp.hasMatch(input)) {
    return false;
  }
  var firstPaddingChar = input.indexOf("=");
  return firstPaddingChar == -1 ||
      firstPaddingChar == input.length - 1 ||
      (firstPaddingChar == input.length - 2 && input[input.length - 1] == '=');
}
