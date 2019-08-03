RegExp _regexBuild({
  symbol = '\$',
  require_symbol = false,
  allow_space_after_symbol = false,
  symbol_after_digits = false,
  allow_negatives = true,
  parens_for_negatives = false,
  negative_sign_before_digits = false,
  negative_sign_after_digits = false,
  allow_negative_sign_placeholder = false,
  thousands_separator = ',',
  decimal_separator = '.',
  allow_decimal = true,
  require_decimal = false,
  digits_after_decimal = const [2],
  allow_space_after_digits = false,
}) {
  var decimal_digits = "\\d{${digits_after_decimal[0]}}";
  digits_after_decimal.asMap().forEach((digit, index) {
    if (index != 0) decimal_digits = '$decimal_digits|\\d{$digit}';
  });
  var _symbol =
          "(\\${symbol.toString().replaceAll('/\./g', '\\.')})${(require_symbol ? '' : '?')}",
      negative = "-?",
      whole_dollar_amount_without_sep = '[1-9]\\d*',
      whole_dollar_amount_with_sep =
          "[1-9]\\d{0,2}(\\$thousands_separator\\d{3})*",
      valid_whole_dollar_amounts = [
    '0',
    whole_dollar_amount_without_sep,
    whole_dollar_amount_with_sep
  ],
      whole_dollar_amount = "(${valid_whole_dollar_amounts.join('|')})?",
      decimal_amount =
          "(\\${decimal_separator}(${decimal_digits}))${require_decimal ? '' : '?'}";
  var pattern = whole_dollar_amount +
      (allow_decimal || require_decimal ? decimal_amount : '');

  if (allow_negatives && !parens_for_negatives) {
    if (negative_sign_after_digits) {
      pattern += negative;
    } else if (negative_sign_before_digits) {
      pattern = negative + pattern;
    }
  }

  // South African Rand, for example, uses R 123 (space) and R-123 (no space)
  if (allow_negative_sign_placeholder) {
    pattern = "( (?!\\-))?${pattern}";
  } else if (allow_space_after_symbol) {
    pattern = " ?${pattern}";
  } else if (allow_space_after_digits) {
    pattern += '( (?!\$))?';
  }

  if (symbol_after_digits) {
    pattern += _symbol;
  } else {
    pattern = _symbol + pattern;
  }

  if (allow_negatives) {
    if (parens_for_negatives) {
      pattern = "(\\(${pattern}\\)|${pattern})";
    } else if (!(negative_sign_before_digits || negative_sign_after_digits)) {
      pattern = negative + pattern;
    }
  }

  return new RegExp('^(?!-? )(?=.*\\d)${pattern}\$');
}

/// Check if string [input] is a currency
/// optional params
/// [symbol] = "$"
/// [require_symbol] = false
/// [allow_space_after_symbol] = false
/// [symbol_after_digits] = false
/// [allow_negatives] = true
/// [parens_for_negatives] = false
/// [negative_sign_before_digits] = false
/// [negative_sign_after_digits] = fasle
/// [allow_negative_sign_placeholder] = false
/// [thousands_separator] = ','
/// [decimal_separator] = '.'
/// [allow_decimal] = true
/// [require_decimal] = false
/// [digits_after_decimal] = const [2]
/// [allow_space_after_digits] = false
bool isCurrency(
  String input, {
  symbol = '\$',
  require_symbol = false,
  allow_space_after_symbol = false,
  symbol_after_digits = false,
  allow_negatives = true,
  parens_for_negatives = false,
  negative_sign_before_digits = false,
  negative_sign_after_digits = false,
  allow_negative_sign_placeholder = false,
  thousands_separator = ',',
  decimal_separator = '.',
  allow_decimal = true,
  require_decimal = false,
  digits_after_decimal = const [2],
  allow_space_after_digits = false,
}) {
  return _regexBuild(
    symbol: symbol,
    require_symbol: require_symbol,
    allow_space_after_symbol: allow_space_after_symbol,
    symbol_after_digits: symbol_after_digits,
    allow_negatives: allow_negatives,
    parens_for_negatives: parens_for_negatives,
    negative_sign_before_digits: negative_sign_before_digits,
    negative_sign_after_digits: negative_sign_after_digits,
    allow_negative_sign_placeholder: allow_negative_sign_placeholder,
    thousands_separator: thousands_separator,
    decimal_separator: decimal_separator,
    allow_decimal: allow_decimal,
    require_decimal: require_decimal,
    digits_after_decimal: digits_after_decimal,
    allow_space_after_digits: allow_space_after_digits,
  ).hasMatch(input);
}
