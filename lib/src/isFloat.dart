RegExp _regExp =
    new RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');

/// check if the string [str] is a float
bool isFloat(String str) {
  return _regExp.hasMatch(str);
}
