/// check if string [string] is whitelisted
/// pass down [chars] @required
bool isWhitelisted(String string, chars) {
  for (var i = string.length - 1; i >= 0; i--) {
    if (chars.indexOf(string[i]) == -1) {
      return false;
    }
  }
  return true;
}
