import 'dart:ui';

class AppColors {
  static final HexColor primary1 = HexColor('#3F8CFC');
  static final HexColor primary2 = HexColor('#F7893A');

  static final HexColor accent1 = HexColor('#50C088');
  static final HexColor accent2 = HexColor('#E3EEFD');

  static final HexColor neutral1 = HexColor('#242527');
  static final HexColor neutral2 = HexColor('#121213');
  static final HexColor neutral3 = HexColor('#3B3D42');

  static final HexColor semantic1 = HexColor('#F7BE0C');
  static final HexColor semantic2 = HexColor('#EB0A1E');

  static final HexColor white = HexColor('#FFFFFF');
  static final HexColor black = HexColor('#101010');

  static final HexColor border = HexColor('#E9E9E9');
  static final HexColor shadow = HexColor('#000000');
  static final HexColor red = HexColor('#FF0000');
  static final HexColor grey = HexColor('#CED0DE');
  static final HexColor deepOrange = HexColor('#FF4500');
  static final HexColor green = HexColor('#00CD00');

  static final HexColor background = HexColor('#FAFAFA');
  static final HexColor background1 = HexColor('#F2F4F8');
  static final HexColor background2 = HexColor('#EAF6EB');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    try {
      hexColor = hexColor.toUpperCase().replaceAll('#', '');
      if (hexColor.length == 6) {
        hexColor = 'FF$hexColor';
      } else if (hexColor.length == 5) {
        hexColor = 'FF${hexColor}0';
      }
      return int.parse(hexColor, radix: 16);
    } catch (_) {
      return int.parse('FFFFFF', radix: 16);
    }
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
