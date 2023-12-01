import 'package:bglobal/src/presentation/widgets/iconsax_icons.dart';
import 'package:bglobal/src/presentation/widgets/widgets.dart';
import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:occam/occam.dart';

import 'root_controller.dart';

@FFRoute(name: '/')
class RootPage extends StateWidget<RootController> {
  const RootPage({Key? key}) : super(key: key);

  @override
  RootController createState() => RootController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RxWidget(
        notifier: state.currentIndex,
        builder: (context, value) => IndexedStack(
          index: value,
          children: state.list,
        ),
      ),
      bottomNavigationBar: RxWidget(
        notifier: state.currentIndex,
        builder: (ctx, index) => BottomNavigationBar(
          currentIndex: index,
          // backgroundColor: Colors.black,
          onTap: state.onTap,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              tooltip: 'Home',
              icon: Icon(
                // Icons.adaptive.flip_camera,
                // Icons.arrow_back
                Iconsax.home_2,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              tooltip: 'Explore',
              icon: Icon(
                Iconsax.discover,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              tooltip: 'Favorites',
              icon: Icon(
                Iconsax.heart
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              tooltip: 'Profile',
              icon: Icon(
                Iconsax.user,
              ),
            ),
          ],
            
        ),
      ),
    );
  }
}
