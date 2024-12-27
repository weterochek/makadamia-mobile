import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makadamia/main.dart'; // Убедитесь, что этот импорт верен

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('WebView widget placeholder test', (WidgetTester tester) async {
    debugPrint('Запуск приложения для теста WebView...');
    await tester.pumpWidget(MyApp());

    debugPrint('Проверка наличия заглушки...');
    expect(find.byType(Container), findsOneWidget);
    expect(find.text('Здесь может быть WebView или заглушка'), findsOneWidget);
    debugPrint('Тест WebView успешно завершен.');
  });

  testWidgets('Counter increments test', (WidgetTester tester) async {
    debugPrint('Запуск приложения для теста счетчика...');
    await tester.pumpWidget(MyApp());

    debugPrint('Проверка начального состояния...');
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    debugPrint('Нажатие на кнопку "+"...');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    debugPrint('Проверка состояния после инкремента...');
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    debugPrint('Тест счетчика успешно завершен.');
  });
}
