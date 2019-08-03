RegExp _regExp = RegExp(r"/^[a-f0-9]{32}$/");

/// check if string [input] is a md5 hash
/// also use [isHash] for more algorithms
bool isMD5(String input) {
  return _regExp.hasMatch(input);
}
