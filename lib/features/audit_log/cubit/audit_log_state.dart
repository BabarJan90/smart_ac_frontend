part of 'audit_log_cubit.dart';

@immutable
sealed class AuditLogState {}

final class AuditLogInitial extends AuditLogState {}

final class AuditLogLoading extends AuditLogState {}

final class AuditLogLoaded extends AuditLogState {
  final DataList<AuditEntry> entries;
  AuditLogLoaded(this.entries);
}

final class AuditLogError extends AuditLogState {
  final String message;
  AuditLogError(this.message);
}
