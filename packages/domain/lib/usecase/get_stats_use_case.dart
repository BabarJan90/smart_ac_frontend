import 'package:domain/domain.dart';
import 'package:domain/model/account_stats.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetStatsUseCase extends UseCase {
  final SmartACApiRepository _repository;

  GetStatsUseCase(this._repository);

  Future<Result<AccountStats>> call() async {
    return _repository.getStats();
  }
}
