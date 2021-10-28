class WordCount {
  Map<String, int> countWords(String text) {
    Map<String, int> counters = {};
    var words = RegExp(r"\w+('\w+)?");
    for (var match in words.allMatches(text.toLowerCase())) {
      var word = match.group(0);
      counters[word] = counters.containsKey(word) ? counters[word] + 1 : 1;
    }
    return counters;
  }
}
