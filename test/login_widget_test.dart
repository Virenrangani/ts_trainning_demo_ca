import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/auth_state.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/page/login_page.dart';

class MockLoginCubit extends Mock implements LoginCubit {}

class FakeAuthState extends Fake implements AuthState {}

void main() {
  final getIt = GetIt.instance;
  late MockLoginCubit mockLoginCubit;

  setUpAll(() {
    registerFallbackValue(FakeAuthState());
  });

  setUp(() {
    getIt.reset();
    mockLoginCubit = MockLoginCubit();

    when(() => mockLoginCubit.state).thenReturn(AuthInitial());
    when(() => mockLoginCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockLoginCubit.login(any(), any())).thenAnswer((_) async {});

    getIt.registerFactory<LoginCubit>(() => mockLoginCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  testWidgets("Login Button test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>.value(
          value: mockLoginCubit,
          child: const LoginPage(),
        ),
      ),
    );

    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);
    expect(find.byKey(const Key('login_key')), findsOneWidget);

    await tester.enterText(find.byKey( Key('emailField')), 'test@gmail.com');
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey( Key('passwordField')), 'Viren3110@');
    await tester.pumpAndSettle();

    final emailField = tester.widget<TextField>(
      find.descendant(
        of: find.byKey(const Key('emailField')),
        matching: find.byType(TextField),
      ),
    );
    final passwordField = tester.widget<TextField>(
      find.descendant(
        of: find.byKey(const Key('passwordField')),
        matching: find.byType(TextField),
      ),
    );
    expect(emailField.controller?.text, 'test@gmail.com');
    expect(passwordField.controller?.text, 'Viren3110@');

    await tester.tap(find.byKey(const Key('login_key')));
    await tester.pumpAndSettle();

    verify(() => mockLoginCubit.login('test@gmail.com', 'Viren3110@')).called(1);
  });
}