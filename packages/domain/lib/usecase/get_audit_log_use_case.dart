import 'package:domain/domain.dart';
import 'package:domain/model/audit_entry.dart';
import 'package:domain/model/data_list.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAuditLogUseCase extends UseCase {
  final SmartACApiRepository _repository;

  GetAuditLogUseCase(this._repository);

  Future<Result<DataList<AuditEntry>>> call() async {
    return _repository.getAuditLog();
  }
}
