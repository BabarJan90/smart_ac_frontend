part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardLoaded extends DashboardState {
  final AccountStats stats;
  final DataList<Transaction> recentTransactions;

  DashboardLoaded({
    required this.stats,
    required this.recentTransactions,
  });
}

final class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
