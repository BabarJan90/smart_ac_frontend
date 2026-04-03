import 'package:domain/domain.dart';
import 'package:domain/model/orchestrator_result.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class RunOrchestratorUseCase extends UseCase {
  final SmartACApiRepository _repository;

  RunOrchestratorUseCase(this._repository);

  Future<Result<OrchestratorResult>> call({String? clientName}) async {
    return _repository.runOrchestrator(clientName: clientName);
  }
}
