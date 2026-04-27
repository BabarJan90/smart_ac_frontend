import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ac/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:smart_ac/features/dashboard/screen/dashboard_screen.dart';

class MockDashboardCubit extends Mock implements DashboardCubit {}

void main() {
  setUpAll(() {
    registerFallbackValue(DashboardInitial());
  });

  testWidgets('given dashboard screen, when it builds should render the UI', (
    tester,
  ) async {
    final mockCubit = MockDashboardCubit();

    when(() => mockCubit.state).thenReturn(DashboardInitial());
    when(
      () => mockCubit.stream,
    ).thenAnswer((_) => Stream<DashboardState>.empty());
    when(() => mockCubit.load()).thenAnswer((_) async {});

    await tester.pumpWidget(
      BlocProvider<DashboardCubit>.value(
        value: mockCubit,
        child: const MaterialApp(home: DashboardScreen()),
      ),
    );

    await tester.pump();

    final text = find.byType(Text);
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
