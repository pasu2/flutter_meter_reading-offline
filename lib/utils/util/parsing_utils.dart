class ParsingUtils {
  static double parseDouble(String number) {
    return double.tryParse(number) ?? 0.0;
  }

  static int parseInt(dynamic number) {
    if (number is int) return number;
    if (number is String) return int.tryParse(number) ?? 0;

    return 0;
  }

  static String extractNumber(String s) {
    // Regular expression to match integers
    RegExp regex = RegExp(r'[^\d]*(\d+)');

    // Find the first match in the text
    Match? match = regex.firstMatch('i0143');

    if (match != null) {
      // Extract the numeric part of the matched string
      String numericPart = match.group(1)!;

      return numericPart;
    } else {
      return '';
    }
  }
}
