/// This is an utility function
shift(List l) {
  if (l.length >= 1) {
    var first = l.first;
    l.removeAt(0);
    return first;
  }
  return null;
}
