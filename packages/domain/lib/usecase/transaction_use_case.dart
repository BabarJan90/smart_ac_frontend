import 'package:domain/domain.dart';
import 'package:domain/model/data_list.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransactionUseCase extends UseCase {
  final SmartACApiRepository _repository;

  TransactionUseCase(this._repository);

  Future<Result<DataList<Transaction>>> call({
    int limit = 100,
    String? riskFilter,
  }) async {
    return _repository.getTransactions(limit: limit, riskFilter: riskFilter);
  }
}
