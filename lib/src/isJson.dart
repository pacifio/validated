import 'dart:convert';

/// check if string [input] is json (stringyfied)
bool isJSON(String input) {
  try {
    jsonDecode(input);
  } catch (e) {
    return false;
  }
  return true;
}
