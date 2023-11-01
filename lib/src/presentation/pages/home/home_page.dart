import 'package:bglobal/src/presentation/widgets/widgets.dart';
import 'package:occam/occam.dart';

import 'home_controller.dart';

class HomePage extends StateWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeController createState() => HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        actions: [
          const Icon(Icons.shopping_bag_outlined).toButton(state.getProducts),
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
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 26,
                    color: Palette.gray3,
                  ),
                  gap12,
                  Expanded(
                    child: Text(
                      'What are you looking for',
                      style: TextStyle(
                        color: Palette.gray3,
                        // letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  gap12,
                  Icon(
                    Icons.camera_alt,
                    size: 26,
                    color: Palette.gray3,
                  ),
                ],
              ),
            ),
            gap24,
            RxWidget(
              notifier: state.categorySelected,
              builder: (context, selected) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories
                        .map(
                          (index) => CupertinoButton(
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
                );
              },
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
                        mainAxisSpacing: 26,
                        crossAxisSpacing: 16,
                        childAspectRatio: 4 / 3,
                      ),
                      itemBuilder: (context, index) {
                        final item = state.list[index];
                        return Container(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Image.network(
                                item.thumbnail,
                                
                                fit: BoxFit.fill,
                              ),
                              Text(item.title)
                            ],
                          ),
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
