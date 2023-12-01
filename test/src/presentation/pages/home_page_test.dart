import 'package:bglobal/src/domain/product/product_domain.dart';
import 'package:bglobal/src/presentation/pages/home/home_page.dart';
import 'package:bglobal/src/presentation/widgets/widgets.dart';
import 'package:bglobal/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:occam/occam.dart';

class MockProductDomain extends Mock implements ProductDomain {
  @override
  Future<Result<List<Product>>> getList() => Future.value(Success([]));
}

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  group('HomePage', () {
    final domain = MockProductDomain();
    getIt.registerFactory<ProductDomain>(
      () => domain,
    );

    testWidgets(
      "discover is available",
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));
        expect(find.text('Discover'), findsOneWidget);
        expect(find.byKey(const Key('shop_icon')), findsOneWidget);
        expect(find.byType(RxWidget<int>), findsOneWidget);
        expect(find.byType(RxWidget<bool>), findsOneWidget);
        // expect(find.byType(Icon), findsOneWidget);
        expect(find.byKey(const Key('camera_icon')), findsOneWidget);
        // expect(find.byType(RxWidget<bool>), fin);
        await tester.enterText(find.byType(TextFormField), 'zapato');
        await tester.pump();
        expect(find.text('zapato'), findsOneWidget);
        // compute((message) => null, message)
      },
    );
    testWidgets(
      "category is available",
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));
        expect(find.text('Categoría 1'), findsOneWidget);

        await tester.tap(find.byKey(const Key('button-1')));
        // await tester.pump();
        expect(find.text('Categoría 2'), findsOneWidget);
      },
    );
  });
}
