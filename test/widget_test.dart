import 'package:xnotes/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen menampilkan judul Xnotes', (tester) async {
    await tester.pumpWidget(const XnotesApp());
    expect(find.text('Xnotes'), findsOneWidget);
  });
}
