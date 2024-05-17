import 'package:flutter/material.dart';
import 'package:flutter_api_samples/material/search_anchor/search_anchor.2.dart' as example;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing IconButton to open a search view in a SearchAnchor', (WidgetTester tester) async {
    await tester.pumpWidget(const example.SearchBarApp());

    final Finder searchIcon = find.byIcon(Icons.search);
    final Finder textWidget0 = find.widgetWithText(Center, 'No item selected');
    final Finder textWidget1 = find.widgetWithText(Center, 'Selected item: item 0');
    final Finder listTile0 = find.widgetWithText(ListTile, 'item 0');
    final Finder listTile1 = find.widgetWithText(ListTile, 'item 1');
    final Finder listTile2 = find.widgetWithText(ListTile, 'item 2');
    final Finder listTile3 = find.widgetWithText(ListTile, 'item 3');
    final Finder listTile4 = find.widgetWithText(ListTile, 'item 4');

    expect(textWidget0, findsOneWidget);

    await tester.tap(searchIcon);
    await tester.pumpAndSettle();

    expect(listTile0, findsOneWidget);
    expect(listTile1, findsOneWidget);
    expect(listTile2, findsOneWidget);
    expect(listTile3, findsOneWidget);
    expect(listTile4, findsOneWidget);

    await tester.tap(listTile0);
    await tester.pumpAndSettle();

    expect(textWidget0,findsNothing);
    expect(textWidget1,findsOneWidget);
    expect(listTile0, findsNothing);
    expect(listTile1, findsNothing);
    expect(listTile2, findsNothing);
    expect(listTile3, findsNothing);
    expect(listTile4, findsNothing);
  });
}
