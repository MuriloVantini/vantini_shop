import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vantini_shop/src/models/product_model.dart';
import 'package:vantini_shop/src/styles.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final GlobalKey rectKey = GlobalKey();
  final GlobalKey stackKey = GlobalKey();
  Offset? imageOffset;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getOffset();
    });
  }

  void _getOffset() {
    final RenderBox imageRenderBox = rectKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox stackRenderBox = stackKey.currentContext!.findRenderObject() as RenderBox;

    final Offset imagePosition = imageRenderBox.localToGlobal(Offset.zero);
    final Offset stackPosition = stackRenderBox.localToGlobal(Offset.zero);

    setState(() {
      imageOffset = imagePosition - stackPosition;
      print('Dx: ${imageOffset!.dx} Dy: ${imageOffset!.dy}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (50 / 100) - 22.5, //((Tamanho da tela) - padding horizontal: 40 - runSpacing do Wrap: 25)/2
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 7.5,
        shadowColor: Theme.of(context).colorScheme.shadow,
        child: Stack(
          key: stackKey,
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  key: rectKey,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image(
                    image: NetworkImage(widget.product.images.first),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      /*
                      Impossível entender o porquê de uma Row ser necessária aqui,
                      mas sem a Row, o texto fica centralizado (?).
                      */

                      Row(
                        children: [
                          Text(
                            Styles.brazilPattern.format(widget.product.price),
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ],
                      ),
                      Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (imageOffset != null)
              Positioned(
                bottom: imageOffset!.dy + 60,
                right: imageOffset!.dx - 75,
                child: IconButton.filled(onPressed: () {}, icon: const Icon(LucideIcons.shoppingCart)),
              )
          ],
        ),
      ),
    );
  }
}
