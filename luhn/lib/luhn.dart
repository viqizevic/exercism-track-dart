class Luhn {
  bool valid(String card) {
    if (RegExp(r"([^ \d])").hasMatch(card)) return false;
    String prepCard = card.replaceAll(RegExp(r"\D"), '');
    if (prepCard.length <= 1) return false;
    List<String> cards = prepCard.split('');
    int sum = int.parse(cards[cards.length - 1]);
    int parity = cards.length % 2;
    for (int i = 0; i <= cards.length - 2; i++) {
      int s = int.parse(cards[i]);
      if (i % 2 == parity) s *= 2;
      if (s > 9) s -= 9;
      sum += s;
    }
    return sum % 10 == 0;
  }
}
