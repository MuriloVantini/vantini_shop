import 'package:intl/intl.dart';

class Styles {
  //Para utilizar: Styles.brazilPattern.format(value);
  //R$ 1.956,06
  static NumberFormat brazilPattern = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);

  //Para utilizar: Styles.simpleBrazilPattern.format(value);
  //R$ 1,96 mil
  static NumberFormat simpleBrazilPattern = NumberFormat.compactCurrency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);
}
