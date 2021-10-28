import 'input.dart';

void main() {
  print(getNounVerb(INPUT, 19690720));
}

void test_run() {
  print(intcode_run(SIMPLE_INPUT01));
  print(intcode_run(SIMPLE_INPUT02));
  print(intcode_run(SIMPLE_INPUT03));
  print(intcode_run(SIMPLE_INPUT04));
  print(intcode_run(restore_1202_program(INPUT)));
}

List<int> intcode_run(List<int> intcode) {
  List<int> result = [...intcode];
  int pos = 0;

  while (0 <= pos && pos < result.length) {
    int opcode = result[pos];
    if (1 == opcode || 2 == opcode) {
      int firstInputPos = result[pos + 1];
      int secondInputPos = result[pos + 2];
      int outputPos = result[pos + 3];

      int firstInput = result[firstInputPos];
      int secondInput = result[secondInputPos];
      int output = null;
      if (1 == opcode) {
        output = firstInput + secondInput;
      } else {
        output = firstInput * secondInput;
      }
      result[outputPos] = output;
      pos = pos + 4;
    } else if (99 == opcode) {
      // STOP;
      pos = -1;
    } else {
      print('Unexpected opcode $opcode');
    }
  }

  return result;
}

List<int> restore_1202_program(List<int> intcode) {
  return restore_program(intcode, 12, 2);
}

List<int> restore_program(List<int> intcode, int noun, int verb) {
  List<int> result = [...intcode];
  result[1] = noun;
  result[2] = verb;
  return result;
}

int getNounVerb(List<int> intcode, int expectedFirstValue) {
  int max = 99;
  for (int i = 0; i <= max; i++) {
    for (int j = 0; j <= max; j++) {
      List<int> result = intcode_run(restore_program(intcode, i, j));
      if (expectedFirstValue == result[0]) {
        return 100 * i + j;
      }
    }
  }
  return null;
}
