import 'package:domain/domain.dart';
import 'package:domain/model/account_document.dart';
import 'package:domain/model/data_list.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDocumentsUseCase extends UseCase {
  final SmartACApiRepository _repository;

  GetDocumentsUseCase(this._repository);

  Future<Result<DataList<AccountDocument>>> call() async {
    return _repository.getDocuments();
  }
}
