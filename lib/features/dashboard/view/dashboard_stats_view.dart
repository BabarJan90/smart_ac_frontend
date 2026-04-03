import 'package:domain/model/account_stats.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_ac/app_theme.dart';
import 'package:smart_ac/widgets.dart';

class DashboardStatsView extends StatelessWidget {
  final AccountStats stats;

  const DashboardStatsView({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: [
            StatCard(
              label: 'Total Transactions',
              value: stats.totalTransactions.toString(),
              icon: Icons.receipt_long,
              color: AppTheme.accent,
            ),
            StatCard(
              label: 'Total Value',
              value: '£${stats.totalValue.toStringAsFixed(0)}',
              icon: Icons.attach_money,
              color: AppTheme.success,
            ),
            StatCard(
              label: 'High Risk',
              value: stats.highRisk.toString(),
              icon: Icons.warning_amber_rounded,
              color: AppTheme.danger,
              subtitle: stats.highRisk > 0 ? 'ACTION NEEDED' : null,
            ),
            StatCard(
              label: 'Anomalies',
              value: stats.anomalyCount.toString(),
              icon: Icons.flag_rounded,
              color: AppTheme.warning,
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildRiskChart(),
      ],
    );
  }

  Widget _buildRiskChart() => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Risk Distribution',
          subtitle: 'Fuzzy logic scoring across all transactions',
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sectionsSpace: 3,
              centerSpaceRadius: 50,
              sections: [
                if (stats.lowRisk > 0)
                  PieChartSectionData(
                    value: stats.lowRisk.toDouble(),
                    color: AppTheme.success,
                    title: '${stats.lowRisk}',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    radius: 60,
                  ),
                if (stats.mediumRisk > 0)
                  PieChartSectionData(
                    value: stats.mediumRisk.toDouble(),
                    color: AppTheme.warning,
                    title: '${stats.mediumRisk}',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    radius: 60,
                  ),
                if (stats.highRisk > 0)
                  PieChartSectionData(
                    value: stats.highRisk.toDouble(),
                    color: AppTheme.danger,
                    title: '${stats.highRisk}',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    radius: 60,
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _legend('Low', AppTheme.success, stats.lowRisk),
            const SizedBox(width: 24),
            _legend('Medium', AppTheme.warning, stats.mediumRisk),
            const SizedBox(width: 24),
            _legend('High', AppTheme.danger, stats.highRisk),
          ],
        ),
      ],
    ),
  );

  Widget _legend(String label, Color color, int count) => Row(
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const SizedBox(width: 6),
      Text(
        '$label ($count)',
        style: const TextStyle(color: AppTheme.textSecond, fontSize: 12),
      ),
    ],
  );
}
