import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccountDocument extends Equatable {
  final int id;
  final String docType;
  final String createdAt;
  final String preview;
  final String content;

  const AccountDocument({
    required this.id,
    required this.docType,
    required this.createdAt,
    required this.preview,
    required this.content,
  });

  String get displayType {
    switch (docType) {
      case 'client_letter':  return 'Client Letter';
      case 'anomaly_report': return 'Anomaly Report';
      default: return docType.replaceAll('_', ' ').toUpperCase();
    }
  }

  @override
  List<Object?> get props => [
    id,
    docType,
    createdAt,
    preview,
    content,
  ];
}
