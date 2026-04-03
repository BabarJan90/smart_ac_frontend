import 'package:domain/domain.dart';
import 'package:domain/model/account_document.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDocumentUseCase extends UseCase {
  final SmartACApiRepository _repository;

  GetDocumentUseCase(this._repository);

  Future<Result<AccountDocument>> call(int documentId) async {
    return _repository.getDocument(documentId);
  }
}
