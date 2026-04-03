import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/orchestrator_result.dart';
import 'package:injectable/injectable.dart';

part 'orchestrator_state.dart';

@injectable
class OrchestratorCubit extends Cubit<OrchestratorState> {
  final RunOrchestratorUseCase _runOrchestratorUseCase;

  OrchestratorCubit(this._runOrchestratorUseCase)
      : super(OrchestratorInitial());

  Future<void> run({String? clientName}) async {
    emit(OrchestratorRunning());
    final result = await _runOrchestratorUseCase(
      clientName: clientName,
    );
    result.when(
      success: (data) => emit(OrchestratorLoaded(data)),
      failed: (error) => emit(OrchestratorError(error.message)),
    );
  }
}
