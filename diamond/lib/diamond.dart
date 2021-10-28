class Diamond {
  List<String> rows(String char) {
    // get upper form first
    List<String> triangle = new Triangle().rows(char);
    List<String> diamond = [];
    diamond.addAll(triangle);
    // add lower part by copying from upper part
    for (int i=triangle.length-2; i>=0; i--) {
      diamond.add(triangle[i]);
    }
    return diamond;
  }
}

class CharCode {
  // get 16-bit UTF-16 code unit, A-Z => 65-90
  static int getCode(String char) => char.toUpperCase().codeUnitAt(0);
  // minus 64 => 1-26
  static int getIndex(String char) => getCode(char)-64;
  // return code, 65-90 => A-Z
  static String getChar(int code) => String.fromCharCode(code);
  // get previous character
  static String getOneLess(String char) => getChar(getCode(char)-1);
}

class Triangle {
  // get upper form of the diamond
  List<String> rows(String char, [String biggestChar]) {
    biggestChar ??= char;
    int biggestIndex = CharCode.getIndex(biggestChar);
    int outerSpacesNumber = biggestIndex - CharCode.getIndex(char);
    String outerSpaces = " " * outerSpacesNumber;
    String currentRow = "$outerSpaces$char";
    if ("A" == char) {
      // simple part: "  A  "
      currentRow += outerSpaces;
      return [currentRow];
    }
    // not A, e.g.: " C   C "
    String innerSpaces = " " * (2*(biggestIndex-outerSpacesNumber)-3);
    currentRow += "$innerSpaces$char$outerSpaces";
    // recursive
    List<String> recurs = rows(CharCode.getOneLess(char), biggestChar);
    recurs.add(currentRow);
    return recurs;
  }
}
