import './isHexadecimal.dart';

/// check if string [input] is a mongo ID
bool isMongoID(String input) {
  return isHexadecimal(input) && input.length == 24;
}
