RegExp _macAddress =
    RegExp(r"/^([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])$/");
RegExp _macAddressNoColons = RegExp(r"/^([0-9a-fA-F]){12}$/");
RegExp _macAddressWithHyphen =
    RegExp(r"/^([0-9a-fA-F][0-9a-fA-F]-){5}([0-9a-fA-F][0-9a-fA-F])$/");
RegExp _macAddressWithSpaces =
    RegExp(r"/^([0-9a-fA-F][0-9a-fA-F]\s){5}([0-9a-fA-F][0-9a-fA-F])$/");

/// Check if string [input] is a MAC Adress
/// [no_colons] is an optional param
bool isMACAddress(String input, {no_colons}) {
  if (no_colons == true) {
    return _macAddressNoColons.hasMatch(input);
  }

  return _macAddress.hasMatch(input) ||
      _macAddressWithHyphen.hasMatch(input) ||
      _macAddressWithSpaces.hasMatch(input);
}
