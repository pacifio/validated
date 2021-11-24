RegExp _numeric = RegExp(r"/^[+-]?([0-9]*[.])?[0-9]+$/");
RegExp _numericNoSymbols = RegExp(r"/^[0-9]+$/");

/// check if the string [input] contains only numbers
bool isNumeric(String input, {bool no_symbols = false}) {
  if (no_symbols) {
    return _numericNoSymbols.hasMatch(input);
  }

  return _numeric.hasMatch(input);
}
