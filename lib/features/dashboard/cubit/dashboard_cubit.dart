import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/account_stats.dart';
import 'package:domain/model/data_list.dart';
import 'package:domain/model/transaction.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final GetStatsUseCase _getStatsUseCase;
  final TransactionUseCase _transactionUseCase;

  DashboardCubit(
    this._getStatsUseCase,
    this._transactionUseCase,
  ) : super(DashboardInitial());

  Future<void> load() async {
    emit(DashboardLoading());

    final statsResult = await _getStatsUseCase();
    final transactionsResult = await _transactionUseCase(limit: 5);

    statsResult.when(
      success: (stats) => transactionsResult.when(
        success: (transactions) => emit(DashboardLoaded(
          stats: stats,
          recentTransactions: transactions,
        )),
        failed: (error) => emit(DashboardError(error.message)),
      ),
      failed: (error) => emit(DashboardError(error.message)),
    );
  }
}
