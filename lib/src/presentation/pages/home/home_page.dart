import 'package:occam/occam.dart';

import '../../widgets/iconsax_icons.dart';
import '../../widgets/widgets.dart';
import 'home_controller.dart';
import 'widgets/product_widget.dart';

class HomePage extends StateWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeController createState() => HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
        ),
        actions: [
          const Icon(
            Icons.shopping_bag_outlined,
            key: Key('shop_icon'),
          ).toButton(state.getProducts),
          gap16
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Palette.gray3, width: .25),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.search_normal,
                    color: Palette.gray3,
                  ),
                  gap12,
                  Expanded(
                    child: TextFormField(
                      onChanged: state.onChanged,
                      decoration: const InputDecoration.collapsed(
                        hintText: '¿Que estas buscando?',
                      ),
                    ),
                  ),
                  gap12,
                  const Icon(
                    Iconsax.camera,
                    size: 26,
                    color: Palette.gray3,
                    key: Key('camera_icon'),
                  ),
                ],
              ),
            ),
            gap24,
            RxWidget<int>(
              notifier: state.categorySelected,
              builder: (context, selected) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.categories
                      .map(
                        (index) => CupertinoButton(
                          key: Key('button-$index'),
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          onPressed: () => state.onCategorySelected(index),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              'Categoría ${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: index == selected
                                    ? Palette.gray1
                                    : Palette.gray4,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            gap32,
            Expanded(
              child: RxWidget<bool>(
                notifier: state.isLoading,
                builder: (ctx, isLoading) {
                  if (isLoading) return loadingIndicator;
                  if (state.list.isEmpty) {
                    return const Center(
                      child: Text('No hay productos'),
                    );
                  }
                  return CupertinoScrollbar(
                    child: GridView.builder(
                      itemCount: state.list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 6 / 7,
                      ),
                      itemBuilder: (context, index) {
                        final item = state.list[index];
                        return ProductWidget(
                          item: item,
                          onTap: () => state.onTap(item),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
