import 'package:domain/model/orchestrator_result.dart';
import 'package:flutter/material.dart';
import 'package:smart_ac/app_theme.dart';
import 'package:smart_ac/widgets.dart';

class OrchestratorActionLogView extends StatelessWidget {
  final List<OrchestratorActionLog> actionLog;

  const OrchestratorActionLogView({super.key, required this.actionLog});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Action Log',
            subtitle: 'Every decision the Orchestrator made',
          ),
          const SizedBox(height: 16),
          ...actionLog.map(
            (log) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 6),
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
                        Text(
                          log.action,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        if (log.detail.isNotEmpty)
                          Text(
                            log.detail,
                            style: const TextStyle(
                              color: AppTheme.textSecond,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
