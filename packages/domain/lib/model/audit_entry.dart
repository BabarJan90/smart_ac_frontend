import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuditEntry extends Equatable {
  final int id;
  final String timestamp;
  final String action;
  final int transactionId;
  final String modelUsed;
  final String justification;

  const AuditEntry({
    required this.id,
    required this.timestamp,
    required this.action,
    required this.transactionId,
    required this.modelUsed,
    required this.justification,
  });

  @override
  List<Object?> get props => [
    id,
    timestamp,
    action,
    transactionId,
    modelUsed,
    justification,
  ];
}
