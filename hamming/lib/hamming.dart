class Hamming {
  int distance(String strand1, String strand2) {
    if (strand1.length != strand2.length)
      throw ArgumentError("Different lengths");
    var diffs = new List<int>.generate(strand1.length, (i) {
      return (strand1[i] != strand2[i] ? 1 : 0);
    });
    return diffs.fold(0, (v, e) => v + e);
  }
}
