import 'dart:math';

const List<String> _BLACKLIST = [
  "00000000000",
  "11111111111",
  "22222222222",
  "33333333333",
  "44444444444",
  "55555555555",
  "66666666666",
  "77777777777",
  "88888888888",
  "99999999999",
  "12345678909"
];

const _STRIP_REGEX = r'[^\d]';

// Compute the Verifier Digit (or "Dígito Verificador (DV)" in PT-BR).
// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
int _verifierDigit(String cpf) {
  List<int> numbers =
  cpf.split("").map((number) => int.parse(number, radix: 10)).toList();

  int modulus = numbers.length + 1;

  List<int> multiplied = [];

  for (var i = 0; i < numbers.length; i++) {
    multiplied.add(numbers[i] * (modulus - i));
  }

  int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

  return (mod < 2 ? 0 : 11 - mod);
}

String _format(String cpf) {
  RegExp regExp = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');

  return _strip(cpf).replaceAllMapped(
      regExp, (Match m) => "${m[1]}.${m[2]}.${m[3]}-${m[4]}");
}

String _strip(String cpf) {
  RegExp regExp = RegExp(_STRIP_REGEX);
  cpf = cpf == null ? "" : cpf;

  return cpf.replaceAll(regExp, "");
}

String generateCPF([bool useFormat = false]) {
  String numbers = "";

  for (var i = 0; i < 9; i += 1) {
    numbers += Random().nextInt(9).toString();
  }

  numbers += _verifierDigit(numbers).toString();
  numbers += _verifierDigit(numbers).toString();

  return (useFormat ? _format(numbers) : numbers);
}

bool isCPF(String cpf, [stripBeforeValidation = true]) {
  if (stripBeforeValidation) {
    cpf = _strip(cpf);
  }

  // CPF must be defined
  if (cpf == null || cpf.isEmpty) {
    return false;
  }

  // CPF must have 11 chars
  if (cpf.length != 11) {
    return false;
  }

  // CPF can't be blacklisted
  if (_BLACKLIST.indexOf(cpf) != -1) {
    return false;
  }

  String numbers = cpf.substring(0, 9);
  numbers += _verifierDigit(numbers).toString();
  numbers += _verifierDigit(numbers).toString();

  return numbers.substring(numbers.length - 2) ==
      cpf.substring(cpf.length - 2);
}