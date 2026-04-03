import 'package:domain/model/orchestrator_result.dart';
import 'package:flutter/material.dart';
import 'package:smart_ac/app_theme.dart';

import 'orchestrator_action_log_view.dart';

class OrchestratorResultView extends StatelessWidget {
  final OrchestratorResult result;

  const OrchestratorResultView({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSummaryCard(),
        const SizedBox(height: 16),
        OrchestratorActionLogView(actionLog: result.actionLog),
        if (result.results.clientLetter.letter.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildLetterCard(),
        ],
        if (result.results.anomalyReport.report.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildAnomalyCard(),
        ],
      ],
    );
  }

  Widget _buildSummaryCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppTheme.success.withOpacity(0.08),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.success.withOpacity(0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle, color: AppTheme.success, size: 20),
            const SizedBox(width: 8),
            const Text(
              'Orchestrator Complete',
              style: TextStyle(
                color: AppTheme.success,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Text(
              '${result.durationSeconds.toStringAsFixed(0)}s',
              style: const TextStyle(color: AppTheme.textSecond, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          result.summary,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: result.planExecuted
              .map(
                (step) => Chip(
                  avatar: const Icon(
                    Icons.smart_toy,
                    size: 14,
                    color: AppTheme.accent,
                  ),
                  label: Text(
                    step.agent,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ),
  );

  Widget _buildLetterCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.mail_outline, color: AppTheme.accent, size: 18),
            SizedBox(width: 8),
            Text(
              'Generated Client Letter',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            result.results.clientLetter.letter,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 13,
              height: 1.7,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildAnomalyCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.danger.withOpacity(0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppTheme.danger, size: 18),
            SizedBox(width: 8),
            Text(
              'Anomaly Report',
              style: TextStyle(
                color: AppTheme.danger,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            result.results.anomalyReport.report,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 13,
              height: 1.7,
            ),
          ),
        ),
      ],
    ),
  );
}
