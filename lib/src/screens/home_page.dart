import 'package:flutter/material.dart';
import 'package:vantini_shop/api/repositories/category_repository.dart';
import 'package:vantini_shop/api/repositories/product_repository.dart';
import 'package:vantini_shop/api/stores/category_store.dart';
import 'package:vantini_shop/api/stores/product_store.dart';
import 'package:vantini_shop/src/components/product_card.dart';
import 'package:vantini_shop/src/models/user_model.dart';

class HomePage extends StatefulWidget {
  final String token;
  final UserModel user;
  const HomePage({super.key, required this.user, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryStore categoryStore = CategoryStore(repository: CategoryRepository());
  ProductStore productStore = ProductStore(repository: ProductRepository());
  @override
  void initState() {
    getHomePageData();
    super.initState();
  }

  Future getHomePageData() async {
    await Future.wait([
      categoryStore.index(widget.token),
      productStore.index(true, widget.token, '', 1),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return RefreshIndicator.adaptive(
      onRefresh: () {
        return getHomePageData();
      },
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 20, right: 20),
        physics: const AlwaysScrollableScrollPhysics(),
        child: AnimatedBuilder(
          animation: Listenable.merge([
            categoryStore.state,
            categoryStore.isLoading,
            categoryStore.erro,
            productStore.state,
            productStore.isLoading,
            productStore.erro,
          ]),
          builder: (context, child) {
            if (categoryStore.isLoading.value) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            final categories = categoryStore.state.value;
            final products1 = productStore.state.value.take(9);
            final products2 = productStore.state.value.skip(9);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Melhor coleção de São Paulo!', style: textTheme.bodySmall),
                const SizedBox(height: 19),
                Wrap(
                  runAlignment: WrapAlignment.start,
                  spacing: 15,
                  children: [
                    ...categories.map((category) {
                      return InkWell(
                        onTap: () {},
                        child: Text(
                          category.name,
                          style: textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    })
                  ],
                ),
                const SizedBox(height: 19),
                Text('Produtos em Alta', style: textTheme.bodyMedium),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        spacing: 15,
                        children: [
                          ...products1.map((product) {
                            return ProductCard(product: product);
                          })
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        runAlignment: WrapAlignment.start,
                        alignment: WrapAlignment.start,
                        spacing: 15,
                        children: [
                          ...products2.map((product) {
                            return ProductCard(product: product);
                          })
                        ],
                      ),
                    ],
                  )
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
