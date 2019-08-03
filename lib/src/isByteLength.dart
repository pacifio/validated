/// check if the string's length (in bytes) falls in a range.
bool isByteLength(String str, {min = 0, max}) {
  var len = Uri.encodeFull(str).split(r'/%..|./').length - 1;
  return len >= min && (max == null || len <= max);
}
