/// This is an utility function
Map merge(Map obj, defaults) {
  if (obj == null) {
    obj = new Map();
  }
  defaults.forEach((key, val) => obj.putIfAbsent(key, () => val));
  return obj;
}
