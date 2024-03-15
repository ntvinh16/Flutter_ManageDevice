import 'dart:convert';

class Utf8Util{
  Utf8Util._();
  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }
  static dynamic utf8convertToJSon(String text) {
    List<int> bytes = text.toString().codeUnits;
    return json.decode(utf8.decode(bytes));
  }
}