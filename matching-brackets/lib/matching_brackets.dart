class MatchingBrackets {
  bool isPaired(String text) {
    List<String> stack = [];
    String last = '';
    for (String curr in text.split('')) {
      last = stack.isNotEmpty ? stack.last : '';
      if ('(' == curr || '[' == curr || '{' == curr) {
        stack.add(curr);
      }
      if (')' == curr || ']' == curr || '}' == curr) {
        if ('(' == last && ')' == curr ||
            '[' == last && ']' == curr ||
            '{' == last && '}' == curr) {
          stack.removeLast();
        } else {
          stack.add(curr);
        }
      }
    }
    return stack.isEmpty;
  }
}
