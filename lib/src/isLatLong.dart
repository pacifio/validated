RegExp _lat = RegExp(r"/^\(?[+-]?(90(\.0+)?|[1-8]?\d(\.\d+)?)$/");
RegExp _long =
    RegExp(r"/^\s?[+-]?(180(\.0+)?|1[0-7]\d(\.\d+)?|\d{1,2}(\.\d+)?)\)?$/");

/// check if string [input] is a latlong
bool isLatLong(String input) {
  if (!input.contains(',')) {
    return false;
  }
  var pair = input.split(',');
  return _lat.hasMatch(pair[0]) && _long.hasMatch(pair[1]);
}
