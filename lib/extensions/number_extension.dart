extension numberExtension on num {
  bool get isInteger => (this % 1) == 0;
  bool get isDecimal => (this % 1) != 0;
}