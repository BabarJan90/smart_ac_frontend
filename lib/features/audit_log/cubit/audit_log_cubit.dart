import 'package:domain/domain.dart';
import 'package:domain/model/data_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'audit_log_state.dart';

@injectable
class AuditLogCubit extends Cubit<AuditLogState> {
  final GetAuditLogUseCase _getAuditLogUseCase;

  AuditLogCubit(this._getAuditLogUseCase) : super(AuditLogInitial());

  Future<void> load() async {
    emit(AuditLogLoading());
    final result = await _getAuditLogUseCase();
    result.when(
      success: (data) => emit(AuditLogLoaded(data)),
      failed: (error) => emit(AuditLogError(error.message)),
    );
  }
}
