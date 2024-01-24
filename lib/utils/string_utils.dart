import 'dart:convert';

class StringUtils {
  static String getDatatypeInString(String input) {
    if (int.tryParse(input) != null) {
      return 'number';
    } else if (double.tryParse(input) != null) {
      return 'number';
    } else if (DateTime.tryParse(input) != null) {
      return 'datetime';
    } else if (bool.tryParse(input) != null) {
      return 'bool';
    }

    return 'string';
  }

  static String rgbaToHex(Map rgba) {
    int r = (rgba["color"]["r"] as double).toInt();
    int g = (rgba["color"]["g"] as double).toInt();
    int b = (rgba["color"]["b"] as double).toInt();
    double a = (rgba["color"]["a"] as double);
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);
    a = a.clamp(0.0, 1.0);

    // Convert to hexadecimal and concatenate
    String hex = '#${r.toRadixString(16).padLeft(2, '0')}'
        '${g.toRadixString(16).padLeft(2, '0')}'
        '${b.toRadixString(16).padLeft(2, '0')}'
        '${(a * 255).round().toRadixString(16).padLeft(2, '0')}';

    return hex.toUpperCase();
  }

  static prettyPrint(Map val) {
    var enc = JsonEncoder.withIndent('  ');
    print(enc.convert(val));
  }


}
