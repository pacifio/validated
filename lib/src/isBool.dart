/// check if a string [input] represents boolean value like true , false , 0 , 1
bool isBoolean(input) {
  return (['true', 'false', '1', '0'].indexOf(input.toString()) >= 0);
}
