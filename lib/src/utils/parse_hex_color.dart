import 'dart:ui';

/* example :
// Color color1 = HexColor("b74093");
// Color color2 = HexColor("#b74093");
*/

class ParseHexToColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  ParseHexToColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
