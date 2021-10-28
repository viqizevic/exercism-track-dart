import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int n) {
    return pow(n * (n + 1) / 2, 2);
  }

  num sumOfSquare(int n) {
    return n * (n + 1) * (2 * n + 1) / 6;
  }

  num differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquare(n);
  }
}
