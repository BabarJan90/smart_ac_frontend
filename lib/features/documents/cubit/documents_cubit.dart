import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/account_document.dart';
import 'package:domain/model/data_list.dart';
import 'package:injectable/injectable.dart';

part 'documents_state.dart';

@injectable
class DocumentsCubit extends Cubit<DocumentsState> {
  final GetDocumentsUseCase _getDocumentsUseCase;

  DocumentsCubit(this._getDocumentsUseCase)
      : super(DocumentsInitial());

  Future<void> load() async {
    emit(DocumentsLoading());
    final result = await _getDocumentsUseCase();
    result.when(
      success: (data) => emit(DocumentsLoaded(data)),
      failed: (error) => emit(DocumentsError(error.message)),
    );
  }
}
