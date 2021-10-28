import 'input.dart';

void main() {
  print(getSumOfFuels(INPUT.map((mass) => totalFuelNeeded(mass)).toList()));
}

int getSumOfFuels(List<int> fuels) {
  return fuels.fold<int>(0, (sum, fuel) => sum + fuel);
}

int totalFuelNeeded(int mass) {
  int newFuel = neededFuel(mass);
  int total = 0;
  while (newFuel > 0) {
    total += newFuel;
    newFuel = neededFuel(newFuel);
  }
  return total;
}

int neededFuel(int mass) {
  return (mass / 3).floor() - 2;
}
