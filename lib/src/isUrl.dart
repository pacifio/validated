// Taken directly from https://github.com/karan/validator.dart/blob/master/lib/src/validator.dart
import './merge.dart';
import './shift.dart';
import './isIp.dart';
import './isFQDN.dart';

/// check if the string [input] is a URL
///
/// `options` is a `Map` which defaults to
/// `{ 'protocols': ['http','https','ftp'], 'require_tld': true,
/// 'require_protocol': false, 'allow_underscores': false,
/// 'host_whitelist': false, 'host_blacklist': false }`.
bool isURL(String input, [Map? options]) {
  if (input.isEmpty || input.length > 2083 || input.indexOf('mailto:') == 0) {
    return false;
  }

  Map default_url_options = {
    'protocols': ['http', 'https', 'ftp'],
    'require_tld': true,
    'require_protocol': false,
    'allow_underscores': false
  };

  if (options == null) {
    options = default_url_options;
  } else {
    options = merge(options, default_url_options);
  }

  var protocol,
      user,
      auth,
      host,
      hostname,
      port,
      port_str,
      path,
      query,
      hash,
      split;

  // check protocol
  split = input.split('://');
  if (split.length > 1) {
    protocol = shift(split);
    if (options['protocols'].indexOf(protocol) == -1) {
      return false;
    }
  } else if (options['require_protocols'] == true) {
    return false;
  }
  input = split.join('://');

  // check hash
  split = input.split('#');
  input = shift(split);
  hash = split.join('#');
  if (hash != null && hash != "" && RegExp(r'\s').hasMatch(hash)) {
    return false;
  }

  // check query params
  split = input.split('?');
  input = shift(split);
  query = split.join('?');
  if (query != null && query != "" && RegExp(r'\s').hasMatch(query)) {
    return false;
  }

  // check path
  split = input.split('/');
  input = shift(split);
  path = split.join('/');
  if (path != null && path != "" && RegExp(r'\s').hasMatch(path)) {
    return false;
  }

  // check auth type urls
  split = input.split('@');
  if (split.length > 1) {
    auth = shift(split);
    if (auth.indexOf(':') >= 0) {
      auth = auth.split(':');
      user = shift(auth);
      if (!RegExp(r'^\S+$').hasMatch(user)) {
        return false;
      }
      auth.join(':');
      if (!RegExp(r'^\S*$').hasMatch(user)) {
        return false;
      }
    }
  }

  // check hostname
  hostname = split.join('@');
  split = hostname.split(':');
  host = shift(split);
  if (split.length > 0) {
    port_str = split.join(':');
    try {
      port = int.parse(port_str, radix: 10);
    } catch (e) {
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(port_str) || port <= 0 || port > 65535) {
      return false;
    }
  }

  if (!isIP(host) && !isFQDN(host, options) && host != 'localhost') {
    return false;
  }

  if (options['host_whitelist'] == true &&
      options['host_whitelist'].indexOf(host) == -1) {
    return false;
  }

  if (options['host_blacklist'] == true &&
      options['host_blacklist'].indexOf(host) != -1) {
    return false;
  }

  return true;
}
