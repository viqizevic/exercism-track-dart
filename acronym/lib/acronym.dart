class Acronym {
  String abbreviate(String text) {
    Iterable<Match> matches =
        RegExp(r"(\w+)").allMatches(text.replaceAll(RegExp(r"[_\']"), ''));
    return matches
        .fold<String>('', (c, m) => '$c${m.group(0)[0]}')
        .toUpperCase();
  }
}
