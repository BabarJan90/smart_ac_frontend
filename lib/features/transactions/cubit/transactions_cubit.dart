import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/data_list.dart';
import 'package:domain/model/transaction.dart';
import 'package:injectable/injectable.dart';

part 'transactions_state.dart';

@injectable
class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionUseCase _transactionUseCase;

  TransactionsCubit(this._transactionUseCase) : super(TransactionsInitial());

  Future<void> loadTransactions({
    int limit = 100,
    String? riskFilter,
  }) async {
    emit(TransactionsLoading());
    final result = await _transactionUseCase(
      limit: limit,
      riskFilter: riskFilter,
    );
    result.when(
      success: (data) => emit(TransactionsLoaded(
        transactions: data,
        riskFilter: riskFilter,
      )),
      failed: (error) => emit(TransactionsError(error.message)),
    );
  }

  Future<void> filterByRisk(String? riskFilter) async {
    await loadTransactions(riskFilter: riskFilter);
  }
}
