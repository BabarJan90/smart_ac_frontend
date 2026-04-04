import 'package:domain/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_ac/app_theme.dart';
import 'package:smart_ac/widgets.dart';

class TransactionItemView extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? onTap;

  const TransactionItemView({super.key, required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(symbol: '£');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: transaction.isAnomaly
                ? AppTheme.danger.withAlpha(102)
                : AppTheme.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppTheme.riskBg(transaction.riskLabel),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  transaction.vendor[0].toUpperCase(),
                  style: TextStyle(
                    color: AppTheme.riskColor(transaction.riskLabel),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          transaction.vendor,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (transaction.isAnomaly) ...[
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.flag,
                          color: AppTheme.danger,
                          size: 14,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    transaction.category.isEmpty
                        ? 'Uncategorised'
                        : transaction.category,
                    style: const TextStyle(
                      color: AppTheme.textSecond,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  fmt.format(transaction.amount),
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                RiskBadge(label: transaction.riskLabel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
