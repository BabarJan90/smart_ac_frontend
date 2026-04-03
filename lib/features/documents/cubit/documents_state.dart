part of 'documents_cubit.dart';

@immutable
sealed class DocumentsState {}

final class DocumentsInitial extends DocumentsState {}

final class DocumentsLoading extends DocumentsState {}

final class DocumentsLoaded extends DocumentsState {
  final DataList<AccountDocument> documents;
  DocumentsLoaded(this.documents);
}

final class DocumentsError extends DocumentsState {
  final String message;
  DocumentsError(this.message);
}
