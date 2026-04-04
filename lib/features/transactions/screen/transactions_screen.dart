import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ac/features/transactions/cubit/transactions_cubit.dart';
import 'package:smart_ac/features/transactions/view/transaction_detail_view.dart';
import 'package:smart_ac/features/transactions/view/transaction_item_view.dart';

import '../../../app_theme.dart';
import '../../../widgets.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String _search = '';

  @override
  void initState() {
    super.initState();
    context.read<TransactionsCubit>().loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: BlocBuilder<TransactionsCubit, TransactionsState>(
              builder: (context, state) {
                return switch (state) {
                  TransactionsInitial() => const SizedBox.shrink(),
                  TransactionsLoading() => _buildLoading(),
                  TransactionsLoaded() => _buildList(state),
                  TransactionsError() => _buildError(state.message),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() => Container(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
    color: AppTheme.background,
    child: Column(
      children: [
        TextField(
          onChanged: (v) => setState(() => _search = v),
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: 'Search transactions...',
            hintStyle: const TextStyle(color: AppTheme.textSecond),
            prefixIcon: const Icon(Icons.search, color: AppTheme.textSecond),
            filled: true,
            fillColor: AppTheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.accent),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _filterChip(null, 'All'),
              const SizedBox(width: 8),
              _filterChip('high', 'High Risk'),
              const SizedBox(width: 8),
              _filterChip('medium', 'Medium'),
              const SizedBox(width: 8),
              _filterChip('low', 'Low Risk'),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _filterChip(String? value, String label) {
    final state = context.watch<TransactionsCubit>().state;
    final currentFilter = state is TransactionsLoaded ? state.riskFilter : null;
    final selected = currentFilter == value;
    final color = value == null ? AppTheme.accent : AppTheme.riskColor(value);

    return GestureDetector(
      onTap: () => context.read<TransactionsCubit>().filterByRisk(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? color.withAlpha(38) : AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? color : AppTheme.border,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? color : AppTheme.textSecond,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => ListView(
    padding: const EdgeInsets.all(16),
    children: List.generate(
      5,
      (_) => const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: LoadingCard(height: 90),
      ),
    ),
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
          onPressed: () => context.read<TransactionsCubit>().loadTransactions(),
          icon: const Icon(Icons.refresh, size: 16),
          label: const Text('Retry'),
        ),
      ],
    ),
  );

  Widget _buildList(TransactionsLoaded state) {
    final filtered = _search.isEmpty
        ? state.transactions.items
        : state.transactions.items
              .where(
                (t) =>
                    t.vendor.toLowerCase().contains(_search.toLowerCase()) ||
                    t.category.toLowerCase().contains(_search.toLowerCase()),
              )
              .toList();

    if (filtered.isEmpty) {
      return const EmptyState(
        icon: Icons.receipt_long,
        title: 'No transactions found',
        subtitle: 'Try changing your search or filter',
      );
    }

    return RefreshIndicator(
      onRefresh: () => context.read<TransactionsCubit>().loadTransactions(
        riskFilter: state.riskFilter,
      ),
      color: AppTheme.accent,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filtered.length,
        itemBuilder: (ctx, i) => TransactionItemView(
          transaction: filtered[i],
          onTap: () => _showDetail(filtered[i]),
        ),
      ),
    );
  }

  void _showDetail(transaction) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (_) => TransactionDetailView(transaction: transaction),
    );
  }
}
