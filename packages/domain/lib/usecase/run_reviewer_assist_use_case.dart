import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class RunReviewerAssistUseCase extends UseCase {
  final SmartACApiRepository _repository;

  RunReviewerAssistUseCase(this._repository);

  Future<void> call() async {
    return _repository.runReviewerAssist();
  }
}
