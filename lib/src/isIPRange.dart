import './isIP.dart';

RegExp _subnetMaybe = RegExp(r"/^\d{1,2}$/");

/// check if the string [str] falls in an IP range
bool isIPRange(String input) {
  var parts = input.split('/');
  if (parts.length != 2) {
    return false;
  }
  if (!_subnetMaybe.hasMatch(parts[1])) {
    return false;
  }
  if (parts[1].length > 1 && parts[1].startsWith('0')) {
    return false;
  }
  return isIP(parts[0], 4) &&
      int.parse(parts[1]) <= 32 &&
      int.parse(parts[1]) >= 0;
}
