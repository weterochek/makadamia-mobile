import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart'; // Относительный путь к main.dart

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Передаём параметр websiteUrl, чтобы соответствовать требованиям конструктора MyApp
    await tester.pumpWidget(const MyApp(
      websiteUrl: 'https://mobile-site.onrender.com',
      skipLaunch: true,
    ));

    // Проверка наличия индикатора загрузки
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
