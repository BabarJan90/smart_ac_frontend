import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnomalyReport extends Equatable {
  final String status;
  final String report;

  const AnomalyReport({
    required this.status,
    required this.report,
  });

  @override
  List<Object?> get props => [
    status,
    report,
  ];
}
