import './isFullWidth.dart';
import './isHalfWidth.dart';

/// check if the string contains a mixture of full and half-width chars
bool isVariableWidth(String input) {
  return isFullWidth(input) && isHalfWidth(input);
}
