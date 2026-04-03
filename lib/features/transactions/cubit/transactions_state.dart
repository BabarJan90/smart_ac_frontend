part of 'transactions_cubit.dart';

@immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsLoaded extends TransactionsState {
  final DataList<Transaction> transactions;
  final String? riskFilter;

  TransactionsLoaded({
    required this.transactions,
    this.riskFilter,
  });
}

final class TransactionsError extends TransactionsState {
  final String message;
  TransactionsError(this.message);
}
