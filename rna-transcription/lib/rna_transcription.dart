class RnaTranscription {
  final Map<String, String> complementRna = {
    "G": "C",
    "C": "G",
    "T": "A",
    "A": "U",
  };

  String toRna(String dna) {
    if (RegExp(r"[^GCTA]").hasMatch(dna.toUpperCase()))
      throw ArgumentError("Unexpected DNA nucleotide");
    return dna.split('').map((String n) => complementRna[n]).toList().join("");
  }
}
