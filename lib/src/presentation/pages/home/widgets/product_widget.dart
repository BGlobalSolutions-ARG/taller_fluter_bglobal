// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bglobal/src/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../widgets/widgets.dart';

class ProductWidget extends StatelessWidget {
  final Product item;
  final VoidCallback onTap;
  const ProductWidget({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // flex: 6,
              child: CachedNetworkImage(
                cacheKey: item.id.toString(),
                imageUrl: item.thumbnail,
                placeholder: (ctx, url) => loadingIndicator,
                errorWidget: (context, url, error) => Text(
                  error.toString(),
                ),
                imageBuilder: (ctx, image) => Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Palette.gray6,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      image: DecorationImage(
                        image: image,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    // maxLines: 1,s,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Palette.gray2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.yellow,
                      ),
                      Text(
                        item.rating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Palette.gray1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$ ${item.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.gray1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
