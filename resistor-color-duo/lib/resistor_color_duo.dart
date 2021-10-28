class ResistorColorDuo {
  List<String> colors = ['black', 'brown', 'red', 'orange', 'yellow',
    'green', 'blue', 'violet', 'grey', 'white'];

  int colorCode(String colorName) {
    return colors.indexOf(colorName);
  }

  // Put your code here
  int value(List<String> colors) {
    return colorCode(colors.elementAt(0))*10 + colorCode(colors.elementAt(1));
  }
}
