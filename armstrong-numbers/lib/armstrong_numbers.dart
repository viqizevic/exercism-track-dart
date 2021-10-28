import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(int number) {
    String asWord = number.toString();
    int exponent = asWord.length;
    int sum = 0;
    for (int i = 0; i < asWord.length; i++) {
      sum += pow(int.parse(asWord[i]), exponent).toInt();
      if (sum > number) return false;
    }
    return (sum == number);
  }
}
