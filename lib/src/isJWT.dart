RegExp _regExp = RegExp(
    r"/^([A-Za-z0-9\-_~+\/]+[=]{0,2})\.([A-Za-z0-9\-_~+\/]+[=]{0,2})(?:\.([A-Za-z0-9\-_~+\/]+[=]{0,2}))?$/");

/// check if string [input] is a JWT token
bool isJWT(String input) {
  return _regExp.hasMatch(input);
}
