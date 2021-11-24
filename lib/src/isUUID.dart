var _uuid = {
  '3': RegExp(
      r"/^[0-9A-F]{8}-[0-9A-F]{4}-3[0-9A-F]{3}-[0-9A-F]{4}-[0-9A-F]{12}$/i"),
  '4': RegExp(
      r"/^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i"),
  '5': RegExp(
      r"/^[0-9A-F]{8}-[0-9A-F]{4}-5[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i"),
  'all': RegExp(
      r"/^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$/i"),
};

/// check if string [input] is an UUID (version 3, 4 or 5
/// version is an optional positioned param
/// pass String value for [version]
/// [version] expected values -> '3', '4', '5', 'all'
/// by default 'all' is used
bool isUUID(String input, [String version = 'all']) {
  RegExp pattern = _uuid[version]!;
  return pattern.hasMatch(input);
}
