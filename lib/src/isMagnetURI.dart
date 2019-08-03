RegExp _regExp =
    RegExp(r"/^magnet:\?xt=urn:[a-z0-9]+:[a-z0-9]{32,40}&dn=.+&tr=.+$/i");

/// check if string [input] is a magnet URI
bool isMagnetURI(String input) {
  return _regExp.hasMatch(input.trim());
}
