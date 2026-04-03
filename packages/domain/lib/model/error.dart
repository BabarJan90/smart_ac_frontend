import 'package:equatable/equatable.dart';

class Error extends Equatable {
  final int code;
  final String message;
  final double retailPrice;
  final double discountedPrice;
  final double savedPrice;
  final String reason;
  final String type;

  const Error({
    this.code = kUnknown,
    required this.message,
    this.retailPrice = kDefaultPrice,
    this.discountedPrice = kDefaultPrice,
    this.savedPrice = kDefaultPrice,
    this.reason = '',
    this.type = 'unknown',
  });

  const Error.message(
    this.message, {
    this.code = kUnknown,
    this.retailPrice = kDefaultPrice,
    this.discountedPrice = kDefaultPrice,
    this.savedPrice = kDefaultPrice,
    this.reason = '',
    this.type = 'unknown',
  });

  @override
  List<Object?> get props => [
    code,
    message,
    retailPrice,
    discountedPrice,
    savedPrice,
    reason,
    type,
  ];

  ///
  /// Indicates that the error is unknown
  ///
  static const int kUnknown = -1;

  static const double kDefaultPrice = 0.0;
}
