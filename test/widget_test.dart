import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tkm_flutter/12_test/contact_list_page.dart';

void main() {
  testWidgets('test contact list page', (WidgetTester widgetTester) async {
    //  1.注入Widget
    //  pumpWidget返回结果为Future，是异步的
    await widgetTester.pumpWidget(
      //  需要外部包裹MaterialApp
      const MaterialApp(
        home: ContactListPage(names: ['a', 'b', 'c']),
      ),
    );

    //  在Widget中查找某些Widget
    final Finder aText = find.text('a');
    final Finder bText = find.text('b');
    final Finder cText = find.text('c');
    final Finder peopleIcon = find.byIcon(Icons.person);
    final Finder arrowIcon = find.byIcon(Icons.add);

    //  期望结果
    expect(aText, findsOneWidget);
    expect(bText, findsOneWidget);
    expect(cText, findsOneWidget);
    expect(peopleIcon, findsNWidgets(3));
    expect(arrowIcon, findsNothing);
  });
}
