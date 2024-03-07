bool isNotNull(dynamic value) => (value != null);

bool isNull(dynamic value) => (value == null);

bool isIntEven(int value) => (value % 2 == 0);

bool isIntOdd(int value) => (value % 2 != 0);

bool isDoubleWhole(double value) => (value % 1 == 0);

bool isDoubleDecimal(double value) => (value % 1 != 0);

String capitalize(String value) =>
    value.isNotEmpty ? value[0].toUpperCase() + value.substring(1) : '';

String reverseString(String value) => value.split('').reversed.join('');

int sumList(List<int> list) => list.fold(0, (prev, curr) => prev + curr);

int productOfList(List<int> list) => list.fold(1, (prev, curr) => prev * curr);

List<T> removeDuplicates<T>(List<T> list) => list.toSet().toList();

List<T> reverseList<T>(List<T> list) => list.reversed.toList();

int countOccurrences<T>(List<T> list, T item) =>
    list.where((element) => element == item).length;

Map<T, int> countItems<T>(List<T> list) => {
      for (var item in list.toSet())
        item: list.where((element) => element == item).length
    };

List<T> removeNulls<T>(List<T> list) =>
    list.where((item) => item != null).toList();

List<T> filterList<T>(List<T> list, bool Function(T) predicate) =>
    list.where(predicate).toList();

String joinList<T>(List<T> list, [String separator = ', ']) =>
    list.join(separator);

String repeatString(String value, int times) =>
    List.generate(times, (_) => value).join('');

String sliceString(String value, int startIndex, int endIndex) => value
    .substring(startIndex, endIndex < value.length ? endIndex : value.length);

List<T> shuffleList<T>(List<T> list) => List.from(list)..shuffle();

List<List<T>> chunkList<T>(List<T> list, int size) {
  List<List<T>> chunks = [];
  for (var i = 0; i < list.length; i += size) {
    chunks
        .add(list.sublist(i, i + size < list.length ? i + size : list.length));
  }
  return chunks;
}

bool isPalindrome(String value) => value == value.split('').reversed.join('');

String stripHtmlTags(String htmlString) =>
    htmlString.replaceAll(RegExp(r'<[^>]*>'), '');

String removeWhitespace(String value) => value.replaceAll(RegExp(r'\s+'), '');

String truncateString(String value, int maxLength) =>
    value.length <= maxLength ? value : value.substring(0, maxLength);

int fibonacci(int n) => n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2);

List<int> generateFibonacciSequence(int length) {
  List<int> sequence = [];
  for (int i = 0; i < length; i++) {
    sequence.add(fibonacci(i));
  }
  return sequence;
}

bool isPrime(int number) {
  if (number <= 1) return false;
  if (number <= 3) return true;
  if (number % 2 == 0 || number % 3 == 0) return false;
  int i = 5;
  while (i * i <= number) {
    if (number % i == 0 || number % (i + 2) == 0) return false;
    i += 6;
  }
  return true;
}

List<int> generatePrimeNumbers(int count) {
  List<int> primes = [];
  int number = 2;
  while (primes.length < count) {
    if (isPrime(number)) {
      primes.add(number);
    }
    number++;
  }
  return primes;
}

int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

int lcm(int a, int b) => (a * b) ~/ gcd(a, b);

bool isLeapYear(int year) =>
    (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

List<int> generateLeapYears(int startYear, int endYear) =>
    List.generate(endYear - startYear + 1, (index) => startYear + index)
        .where(isLeapYear)
        .toList();

double celsiusToFahrenheit(double celsius) => (celsius * 9 / 5) + 32;

double fahrenheitToCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;

double metersToFeet(double meters) => meters * 3.28084;

double feetToMeters(double feet) => feet * 0.3048;

double kilometersToMiles(double kilometers) => kilometers * 0.621371;

double milesToKilometers(double miles) => miles * 1.60934;

double kilometersPerHourToMetersPerSecond(double kmph) => kmph * 0.277778;

double metersPerSecondToKilometersPerHour(double mps) => mps * 3.6;

double poundsToKilograms(double pounds) => pounds * 0.453592;

double kilogramsToPounds(double kilograms) => kilograms * 2.20462;

double ouncesToGrams(double ounces) => ounces * 28.3495;

double gramsToOunces(double grams) => grams * 0.035274;

String encryptCaesarCipher(String plaintext, int shift) =>
    plaintext.runes.map((rune) {
      if (rune >= 65 && rune <= 90) {
        return String.fromCharCode(((rune - 65 + shift) % 26) + 65);
      } else if (rune >= 97 && rune <= 122) {
        return String.fromCharCode(((rune - 97 + shift) % 26) + 97);
      } else {
        return String.fromCharCode(rune);
      }
    }).join('');

String decryptCaesarCipher(String ciphertext, int shift) =>
    encryptCaesarCipher(ciphertext, 26 - (shift % 26));

List<int> bubbleSort(List<int> list) {
  List<int> sortedList = List.from(list);
  int n = sortedList.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (sortedList[j] > sortedList[j + 1]) {
        int temp = sortedList[j];
        sortedList[j] = sortedList[j + 1];
        sortedList[j + 1] = temp;
      }
    }
  }
  return sortedList;
}

List<int> selectionSort(List<int> list) {
  List<int> sortedList = List.from(list);
  int n = sortedList.length;
  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (sortedList[j] < sortedList[minIndex]) {
        minIndex = j;
      }
    }
    int temp = sortedList[minIndex];
    sortedList[minIndex] = sortedList[i];
    sortedList[i] = temp;
  }
  return sortedList;
}

List<int> insertionSort(List<int> list) {
  List<int> sortedList = List.from(list);
  int n = sortedList.length;
  for (int i = 1; i < n; ++i) {
    int key = sortedList[i];
    int j = i - 1;
    while (j >= 0 && sortedList[j] > key) {
      sortedList[j + 1] = sortedList[j];
      j = j - 1;
    }
    sortedList[j + 1] = key;
  }
  return sortedList;
}
