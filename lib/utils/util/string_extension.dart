extension StringExtension on String {
  int get pareInt {
    return int.parse(this);
  }

  String get capitalize {
    return this[0].toUpperCase();
  }
}
