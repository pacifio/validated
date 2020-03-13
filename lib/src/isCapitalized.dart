/// Check if string [input] is capitalized
bool isCapitalized(String input) {
  var capitalized_first = input.toString()[0].toUpperCase();
  var capitalized = "$capitalized_first${input.toString().substring(1)}";
  return input == capitalized;
}
