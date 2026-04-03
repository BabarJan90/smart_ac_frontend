import 'package:domain/model/audit_entry.dart';
import 'package:flutter/material.dart';
import 'package:smart_ac/app_theme.dart';

class AuditEntryView extends StatelessWidget {
  final AuditEntry entry;

  const AuditEntryView({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              color: AppTheme.accent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.action.replaceAll('_', ' ').toUpperCase(),
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Text(
                      entry.timestamp.length > 19
                          ? entry.timestamp.substring(0, 19)
                          : entry.timestamp,
                      style: const TextStyle(
                        color: AppTheme.textSecond,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                if (entry.justification.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    entry.justification,
                    style: const TextStyle(
                      color: AppTheme.textSecond,
                      fontSize: 12,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.smart_toy,
                      size: 12,
                      color: AppTheme.textSecond,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      entry.modelUsed,
                      style: const TextStyle(
                        color: AppTheme.textSecond,
                        fontSize: 11,
                      ),
                    ),
                    if (entry.transactionId != 0) ...[
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.receipt,
                        size: 12,
                        color: AppTheme.textSecond,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'TX #${entry.transactionId}',
                        style: const TextStyle(
                          color: AppTheme.textSecond,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
