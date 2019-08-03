Map<String, int> _lengths = {
  'md5': 32,
  'md4': 32,
  'sha1': 40,
  'sha256': 64,
  'sha384': 96,
  'sha512': 128,
  'ripemd128': 32,
  'ripemd160': 40,
  'tiger128': 32,
  'tiger160': 40,
  'tiger192': 48,
  'crc32': 8,
  'crc32b': 8,
};

/// check if the string [input] is a hash
/// available algoritms for string [algorithmName] param
/// [md5]
/// [md4]
/// [sha1]
/// [sha256]
/// [sha384]
/// [sha512]
/// [ripemd128]
/// [ripemd160]
/// [tiger128]
/// [tiger160]
/// [tiger192]
/// [crc32]
/// [crc32b]
bool isHash(String input, String algorithmName) {
  return RegExp("^[a-fA-F0-9]{${_lengths[algorithmName]}}\$").hasMatch(input);
}
