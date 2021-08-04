RegExp _regExp = RegExp(r'[\uD800-\uDBFF][\uDC00-\uDFFF]');

/// check if the length of the string [input] falls in a range
bool isLength(String input, int min, [int? max]) {
  List surrogatePairs = _regExp.allMatches(input).toList();
  int len = input.length - surrogatePairs.length;
  return len >= min && (max == null || len <= max);
}
