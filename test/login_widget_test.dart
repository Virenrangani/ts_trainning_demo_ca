import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/auth_state.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/page/login_page.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/page/sign_up_page.dart';
import 'package:ts_training_demo_ca/feature/dashboard/presentation/pages/dashboard.dart';
import 'package:ts_training_demo_ca/feature/product/presentation/cubit/product_cubit.dart';
import 'package:ts_training_demo_ca/feature/product/presentation/cubit/product_state.dart';

class MockLoginCubit extends Mock implements LoginCubit {}

class FakeAuthState extends Fake implements AuthState {}

class MockSignupCubit extends Mock implements SignUpCubit {}

class MockProductCubit extends Mock implements ProductCubit {}

class FakeProductState extends Mock implements ProductState{}

void main() {
  final getIt = GetIt.instance;
  late MockLoginCubit mockLoginCubit;
  late MockProductCubit mockProductCubit;
  late MockSignupCubit mockSignupCubit;


  setUpAll(() {
    registerFallbackValue(FakeAuthState());
  });

  setUp(() {
    getIt.reset();
    mockLoginCubit = MockLoginCubit();
    mockProductCubit= MockProductCubit();
    mockSignupCubit= MockSignupCubit();

    when(() => mockLoginCubit.state).thenReturn(AuthInitial());
    when(() => mockLoginCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockLoginCubit.login(any(), any())).thenAnswer((_) async {});
    when(() => mockLoginCubit.close())
        .thenAnswer((_) async {});

    when(() => mockProductCubit.state).thenReturn(ProductInitial());
    when(() => mockProductCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockProductCubit.getProducts()).thenAnswer((_) async {});
    when(() => mockProductCubit.close())
        .thenAnswer((_) async {});

    when(()=>mockSignupCubit.state).thenReturn(AuthInitial());
    when(()=>mockSignupCubit.stream).thenAnswer((_)=>const Stream.empty());
    when(() => mockSignupCubit.close()).thenAnswer((_) async {});

    getIt.registerFactory<LoginCubit>(() => mockLoginCubit);
    getIt.registerFactory<ProductCubit>(()=>mockProductCubit);
    getIt.registerFactory<SignUpCubit>(()=>mockSignupCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  /*testWidgets("Login button calls login() with valid credentials", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>.value(
          value: mockLoginCubit,
          child: const LoginPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('emailField')), 'test@gmail.com');
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('passwordField')), 'Viren3110@');
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
    expect(passwordField.obscureText, true);

    await tester.tap(find.byKey(const Key('login_key')));
    await tester.pumpAndSettle();

    verify(() => mockLoginCubit.login('test@gmail.com', 'Viren3110@')).called(1);
  });

  testWidgets("Login button should NOT call when fields empty", (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<LoginCubit>.value(
              value: mockLoginCubit,
              child: const LoginPage(),
            ),
          ),
        );

        await tester.tap(find.byKey(const Key("login_key")));
        await tester.pump();

        verifyNever(() => mockLoginCubit.login(any(), any()));
      });*/


  testWidgets("Successful navigation to BottomNavBar", (tester) async {
    whenListen(
      mockLoginCubit,
      Stream.fromIterable([
        AuthLoading(),
        AuthSuccess(),
      ]),
    );
    await tester.pumpWidget(
      TickerMode(
        enabled: true,
      child: MaterialApp(
        home: BlocProvider<LoginCubit>.value(
          value: mockLoginCubit,
          child: const LoginPage(),
        ),
      ),),
    );

    await tester.enterText(find.byKey(const Key('emailField')), 'test@gmail.com');

    await tester.enterText(find.byKey(const Key('passwordField')), 'Viren3110@');

    await tester.ensureVisible(find.byKey(const Key('login_key')));
    await tester.pump();

    await tester.tap(find.byKey(const Key('login_key')), warnIfMissed: false);
    await tester.pump();

    expect(find.byType(Dashboard), findsOneWidget);
  });

 /* testWidgets("Email and Password validation errors", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>.value(
          value: mockLoginCubit,
          child: const LoginPage(),
        ),
      ),
    );

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));

    await tester.enterText(emailField, 'testgmail.com');
    await tester.pumpAndSettle();
    expect(find.textContaining("Enter a valid email"), findsOneWidget);

    await tester.enterText(emailField, 'test @gmail.com');
    await tester.pumpAndSettle();
    expect(find.textContaining("Email should not contain spaces"), findsOneWidget);

    await tester.enterText(passwordField, '');
    await tester.enterText(passwordField, '121');
    await tester.enterText(passwordField, '');
    await tester.pumpAndSettle();
    expect(find.textContaining("Password is required"), findsOneWidget);

    await tester.enterText(passwordField, 'Viren');
    await tester.pumpAndSettle();
    expect(find.textContaining("Minimum 8 characters required"), findsOneWidget);

    await tester.enterText(passwordField, 'viren3110@');
    await tester.pumpAndSettle();
    expect(find.textContaining("Add at least one uppercase letter"), findsOneWidget);

    await tester.enterText(passwordField, 'VIREN21@');
    await tester.pumpAndSettle();
    expect(find.textContaining("Add at least one lowercase letter"), findsOneWidget);

    await tester.enterText(passwordField, 'Viren310');
    await tester.pumpAndSettle();
    expect(find.textContaining("Add at least one special character"), findsOneWidget);

    await tester.enterText(passwordField, 'Viren@abc');
    await tester.pumpAndSettle();
    expect(find.textContaining("Add at least one number"), findsOneWidget);

  });


  testWidgets("Show error snackbar", (WidgetTester tester) async {
    whenListen(
      mockLoginCubit,
      Stream.fromIterable([
        AuthFailure("Login Failed"),
      ]),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>.value(
          value: mockLoginCubit,
          child: const LoginPage(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key("login_key")));
    await tester.pump();

    expect(find.text("Login Failed"), findsOneWidget);
  });*/


  /*testWidgets("Sign up navigation", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginCubit>.value(
          value: mockLoginCubit,
          child: const LoginPage(),
        ),
      ),
    );

    final signUpBtn = find.byKey(const Key('SignUp_Key'));

    await tester.ensureVisible(signUpBtn);
    await tester.tap(signUpBtn);
    await tester.pumpAndSettle();

    expect(find.byType(SignUpPage), findsOneWidget);
  });*/
}