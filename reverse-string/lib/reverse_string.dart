String reverse(String text) {
  if (null == text) return text;
  if (text.length <= 1) return text;
  return reverse(text.substring(1)) + text.substring(0,1);
}
