String formatNumber(num number) {
  if (number >= 1000) {
    double value = number / 1000;
    String formatted = value.toStringAsFixed(1);
        if (formatted.endsWith('.0')) {
      formatted = formatted.substring(0, formatted.length - 2);
    }
    return '${formatted}k';
  }
  return number.toString();
}