import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnalyseAllUseCase extends UseCase {
  final SmartACApiRepository _repository;

  AnalyseAllUseCase(this._repository);

  Future<void> call() async {
    return _repository.analyseAll();
  }
}
