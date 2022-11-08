import 'dart:io';
import 'dart:math';

void main() {
  startFunc();
  
}

// Нужно добавить вариант игры по очереди. Один раунд состоит из двух этапов:

// Пользователь загадывает число, а компьютер отгадывает.
// Компьютер загадывает число, а пользователь отгадывает.

// Указания
// Выигрывает тот, кто угадал число за меньшее число ходов.
// Пользователь может выбрать, сколько раундов длится игра - от 1 до 10. По умолчанию
//в игре 3 раунда (пользователь ничего не ввёл и нажал enter).
// В игре выигрывает тот, кто победил в большем количестве раундов. Если число раундов
// было чётным, то может быть ничья.
// Форматируйте вывод так, чтобы было понятно, кто сейчас играет, выводите номер раунда
// и отделяйте раунды друг от друга отступами. Вы можете использовать строки
//вида "====================" и переносы строк, чтобы аккуратно разделить раунды.

void startFunc() {
  stdout.write('Введите количество раундов: ');
  String answer = stdin.readLineSync()!;
  int roundCounter = 0;

  switch (answer) {
    case ' ':
      print('Вы ничего не ввели. Игра будет идти 3 раунда');
      roundCounter = 3;
      testFunc(roundCounter);

      break;

    case '1':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '2':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '3':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '4':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '5':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '6':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '7':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '8':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '9':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    case '10':
      roundCounter = int.parse(answer);
      testFunc(roundCounter);

      break;

    default:
      print("Неверный формат ввода");
      startFunc();
  }
}

testFunc(int totalRound) {
  print('Вы выбрали количество раундов: $totalRound');
  int currentRound = 1;
  int userCounter = 0;
  int compCounter = 0;

  while (currentRound <= totalRound) {
    print(" ${'=' * 10} Round $currentRound ${'=' * 10} ");
    int userSum = 0;
    int compSum = 0;

    userSum = userFunc();
    compSum = compFunc();

    if (userSum < compSum) {
      userCounter++;
    } else if (userSum > compSum) {
      compCounter++;
    } else {
      userCounter++;
      compCounter++;
    }

    print(" ${'=' * 10} User $userCounter - $compCounter Comp ${'=' * 10}\n");

    currentRound++;
  }

  if (currentRound > totalRound) {
    if (userCounter > compCounter) {
      print('user won');
    } else if (userCounter < compCounter) {
      print('comp won');
    } else {
      print('nichya');
    }
  }
}

int userFunc() {
  print('Загадайте число от 1 до 100');
  int min = 0;
  int max = 100;
  int mid = (min + max) ~/ 2;
  int count = 0;
  String answer = '';
  bool stopGame = false;

  //  print("num is $num");

  while (stopGame == false) {
    print('Ваше число $mid?');
    answer = stdin.readLineSync()!;

    if (answer == 'less') {
      max = mid;
      mid = (min + max) ~/ 2;
      count++;
    } else if (answer == 'greater') {
      min = mid;
      mid = (min + max) ~/ 2;
      count++;
    } else if (answer == 'yes') {
      count++;
      print("Kоличество шагов: ${count}");
      stopGame = true;
    }
  }

  return count;
}

int compFunc() {
  print('Компьютер загадал число от 1 до 100');
  int min = 0;
  int max = 100;
  int count = 0;
  int num = min + Random().nextInt(max - min);
  int userNumber;
  bool stopGame = false;

  // print("num is $num");

  while (stopGame == false) {
    stdout.write('Введите ваше число: ');
    userNumber = int.parse(stdin.readLineSync()!);

    if (userNumber > num) {
      count++;
      print('less');
    } else if (userNumber < num) {
      count++;
      print('greater');
    } else if (userNumber == num) {
      print('yes');
      count++;

      print("Kоличество шагов: ${count}");
      stopGame = true;
    }
  }

  return count;
}


