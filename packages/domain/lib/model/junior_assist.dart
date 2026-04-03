import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class JuniorAssistResult extends Equatable {
  final String status;
  final int processed;
  final List<Categorization> categorisations;

  const JuniorAssistResult({
    required this.status,
    required this.processed,
    required this.categorisations,
  });

  @override
  List<Object?> get props => [
    status,
    processed,
    categorisations,
  ];
}

@injectable
class Categorization extends Equatable {
  final int transactionId;
  final String vendor;
  final String category;
  final double confidence;
  final String notes;

  const Categorization({
    required this.transactionId,
    required this.vendor,
    required this.category,
    required this.confidence,
    required this.notes,
  });

  @override
  List<Object?> get props => [
    transactionId,
    vendor,
    category,
    confidence,
    notes,
  ];
}
