import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


final formatter = NumberFormat.simpleCurrency();

extension DateTimeFormat on DateTime {
  static final DateFormat _calendar = DateFormat('MMM, y', 'es_ES');
  static final DateFormat _yearFormat = DateFormat.y('es_ES');

  static final _format = DateFormat('dd/MM/yyyy');
  static final _monthformat = DateFormat('MMM, yyyy');
  static final _weekDayformat = DateFormat('E', 'es_ES');

  static final _dayformat = DateFormat.Hm().addPattern('dd/MM/yyyy');

  static final _hourFormat = DateFormat('Hm');

  String get calendarFormat => _calendar.format(this);
  String get yearFormat => _yearFormat.format(this);

  String get format => _format.format(this);
  String get dayFormat => _dayformat.format(this);
  String get monthFormat => _monthformat.format(this);
  String get hourFormat => _hourFormat.format(this);
  String get weekdayFormat =>
      _weekDayformat.format(this).capitalize.replaceAll('.', '');

  bool isInTheSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool get isToday {
    final other = DateTime.now();
    return year == other.year && month == other.month && day == other.day;
  }
}

extension Help on String {
  String get capitalize {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }

  String countryCodeToEmoji() {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  num get parse => PriceFormat.f.parse(this);
}

extension PriceFormat on num? {
  static final f = NumberFormat("###,###,##0.##", "en_US");
  String get format => formatter.format(this);
  String get simpleFormat => f.format(this);
}

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    var n = newValue.text.replaceAll(',', '');
    var text = '';
    if (n.startsWith('.')) {
      if (n.length > 1) {
        final value = PriceFormat.f.parse('0$n');
        text = value.simpleFormat;
      } else {
        text = n;
      }
    } else if (n.endsWith('.')) {
      final value = PriceFormat.f.parse(n.replaceAll('.', ''));
      text = '${value.simpleFormat}.';
    } else {
      final value = PriceFormat.f.parse(n);
      text = value.simpleFormat;
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(
        offset: text.length,
      ),
    );
  }
}
