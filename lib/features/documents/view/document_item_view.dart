import 'package:domain/model/account_document.dart';
import 'package:flutter/material.dart';
import 'package:smart_ac/app_theme.dart';

class DocumentItemView extends StatelessWidget {
  final AccountDocument document;
  final VoidCallback? onTap;

  const DocumentItemView({super.key, required this.document, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isLetter = document.docType == 'client_letter';
    final color = isLetter ? AppTheme.accent : AppTheme.danger;
    final icon = isLetter ? Icons.mail_outline : Icons.warning_amber_rounded;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.border),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withAlpha(31),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    document.displayType,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    document.preview,
                    style: const TextStyle(
                      color: AppTheme.textSecond,
                      fontSize: 12,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    document.createdAt,
                    style: const TextStyle(
                      color: AppTheme.textSecond,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppTheme.textSecond,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
