class Isogram {
  bool isIsogram(String string) {
    if (string.isEmpty) return true;
    Set<String> checks = {};
    Set<String> ignores = {' ', '-'};
    for (var char in string.toLowerCase().split('')) {
      if (ignores.contains(char)) continue;
      if (checks.contains(char)) return false;
      checks.add(char);
    }
    return true;
  }
}
