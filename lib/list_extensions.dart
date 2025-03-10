part of 'fluttermay.dart';

extension ListExtensions<T> on List<T> {
  /// Gets the First Element of a list or null if the list is empty
  T? firstOrNull() => isNotEmpty ? first : null;

  /// Gets the Last Element of a list or null if the list is empty
  T? lastOrNull() => isNotEmpty ? last : null;


  /// TAMAY
  T? tamay() => isNotEmpty ? last : null;


  // T? testMethode() => isNotEmpty && length > 1 ? this[1] : null;

}