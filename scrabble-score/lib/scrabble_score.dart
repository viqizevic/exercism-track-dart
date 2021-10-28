Map<int, Set<String>> scoreChars = {
  1: {'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'},
  2: {'D', 'G'},
  3: {'B', 'C', 'M', 'P'},
  4: {'F', 'H', 'V', 'W', 'Y'},
  5: {'K'},
  8: {'J', 'X'},
  10: {'Q', 'Z'},
};

int score(String word) {
  if (null == word) return 0;
  if (0 == word.length) return 0;

  int total = 0;
  for (var char in word.split('')) {
    for (int score in scoreChars.keys) {
      if (scoreChars[score].contains(char.toUpperCase())) {
        total += score;
        continue;
      }
    }
  }
  return total;
}
