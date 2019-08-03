// Inspired from: https://github.com/manishsaraan/email-validator

// https://regexr.com/2rhq7
RegExp _email_regex = new RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

/// Check if string [input] is an email
bool isEmail(String input) {
  if (input == null) {
    return false;
  }
  if (input.toString().length > 254) {
    return false;
  }
  var valid = _email_regex.hasMatch(input);
  if (!valid) {
    return false;
  }

  var parts = input.toString().split('@');
  if (parts[0].length > 64) {
    return false;
  }

  var domainParts = parts[1].split(".");
  if (domainParts.every((part) => part.length > 63)) {
    return false;
  }

  return true;
}
