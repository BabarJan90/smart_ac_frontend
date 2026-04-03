import 'package:domain/model/account_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ac/app_theme.dart';
import 'package:smart_ac/features/documents/cubit/documents_cubit.dart';
import 'package:smart_ac/features/documents/view/document_item_view.dart';
import 'package:smart_ac/widgets.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DocumentsCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DocumentsCubit, DocumentsState>(
        builder: (context, state) {
          return switch (state) {
            DocumentsInitial() => const SizedBox.shrink(),
            DocumentsLoading() => _buildLoading(),
            DocumentsLoaded() => _buildList(state),
            DocumentsError() => _buildError(state.message),
          };
        },
      ),
    );
  }

  Widget _buildLoading() => ListView(
    padding: const EdgeInsets.all(16),
    children: List.generate(
      3,
      (_) => const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: LoadingCard(height: 100),
      ),
    ),
  );

  Widget _buildError(String message) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, color: AppTheme.danger, size: 48),
        const SizedBox(height: 16),
        Text(message, style: const TextStyle(color: AppTheme.textSecond)),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () => context.read<DocumentsCubit>().load(),
          icon: const Icon(Icons.refresh, size: 16),
          label: const Text('Retry'),
        ),
      ],
    ),
  );

  Widget _buildList(DocumentsLoaded state) {
    if (state.documents.items.isEmpty) {
      return const EmptyState(
        icon: Icons.description_outlined,
        title: 'No documents yet',
        subtitle:
            'Run the Orchestrator to generate\nclient letters and reports',
      );
    }
    return RefreshIndicator(
      onRefresh: () => context.read<DocumentsCubit>().load(),
      color: AppTheme.accent,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.documents.items.length,
        itemBuilder: (ctx, i) => DocumentItemView(
          document: state.documents.items[i],
          onTap: () => _showDetail(state.documents.items[i]),
        ),
      ),
    );
  }

  void _showDetail(AccountDocument doc) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        builder: (_, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              doc.displayType,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              doc.createdAt,
              style: const TextStyle(color: AppTheme.textSecond, fontSize: 12),
            ),
            const Divider(height: 32),
            Text(
              doc.content,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 14,
                height: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
