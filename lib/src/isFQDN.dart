import './merge.dart';

/// check if the string [input] is a fully qualified domain name (e.g. domain.com).
///
/// * [requireTld] sets if TLD is required
/// * [allowUnderscore] sets if underscores are allowed
bool isFQDN(input, [options]) {
  Map default_fqdn_options = {'require_tld': true, 'allow_underscores': false};

  options = merge(options, default_fqdn_options);
  List parts = input.split('.');
  if (options['require_tld']) {
    var tld = parts.removeLast();
    if (parts.length == 0 || !RegExp(r'^[a-z]{2,}$').hasMatch(tld)) {
      return false;
    }
  }

  for (var part, i = 0; i < parts.length; i++) {
    part = parts[i];
    if (options['allow_underscores']) {
      if (part.indexOf('__') >= 0) {
        return false;
      }
    }
    if (!RegExp(r'^[a-z\\u00a1-\\uffff0-9-]+$').hasMatch(part)) {
      return false;
    }
    if (part[0] == '-' ||
        part[part.length - 1] == '-' ||
        part.indexOf('---') >= 0) {
      return false;
    }
  }
  return true;
}
