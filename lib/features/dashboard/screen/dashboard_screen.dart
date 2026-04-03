import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ac/app_theme.dart';
import 'package:smart_ac/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:smart_ac/features/dashboard/view/dashboard_stats_view.dart';
import 'package:smart_ac/features/transactions/view/transaction_item_view.dart';
import 'package:smart_ac/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return switch (state) {
            DashboardInitial() => const SizedBox.shrink(),
            DashboardLoading() => _buildLoading(),
            DashboardLoaded() => _buildContent(state),
            DashboardError() => _buildError(state.message),
          };
        },
      ),
    );
  }

  Widget _buildLoading() => ListView(
    padding: const EdgeInsets.all(24),
    children: [
      const LoadingCard(height: 100),
      const SizedBox(height: 16),
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
        children: List.generate(4, (_) => const LoadingCard()),
      ),
    ],
  );

  Widget _buildError(String message) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, color: AppTheme.danger, size: 48),
        const SizedBox(height: 16),
        Text(
          message,
          style: const TextStyle(color: AppTheme.textSecond),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () => context.read<DashboardCubit>().load(),
          icon: const Icon(Icons.refresh, size: 16),
          label: const Text('Retry'),
        ),
      ],
    ),
  );

  Widget _buildContent(DashboardLoaded state) => RefreshIndicator(
    onRefresh: () => context.read<DashboardCubit>().load(),
    color: AppTheme.accent,
    child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildHeader(),
        const SizedBox(height: 28),
        DashboardStatsView(stats: state.stats),
        const SizedBox(height: 28),
        SectionHeader(
          title: 'Recent Transactions',
          subtitle: 'Latest 5 entries',
          action: TextButton(onPressed: () {}, child: const Text('View all')),
        ),
        const SizedBox(height: 16),
        ...state.recentTransactions.items.map(
          (t) => TransactionItemView(transaction: t),
        ),
      ],
    ),
  );

  Widget _buildHeader() => Row(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.accentGlow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.account_balance,
          color: AppTheme.accent,
          size: 22,
        ),
      ),
      const SizedBox(width: 12),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SmartAC',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'AI Accounting Dashboard',
            style: TextStyle(color: AppTheme.textSecond, fontSize: 13),
          ),
        ],
      ),
      const Spacer(),
      IconButton(
        onPressed: () => context.read<DashboardCubit>().load(),
        icon: const Icon(Icons.refresh, color: AppTheme.textSecond),
        tooltip: 'Refresh',
      ),
    ],
  );
}
