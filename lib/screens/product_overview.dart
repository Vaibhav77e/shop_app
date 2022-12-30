import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum selectedFilters { onlyFavoriates, all }

class ProductOverview extends StatefulWidget {
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedFilters selectedValue) {
              setState(() {
                if (selectedValue == selectedFilters.onlyFavoriates) {
                  _showOnlyFav = true;
                } else {
                  _showOnlyFav = false;
                }
              });
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                child: Text('Only Favoriates'),
                value: selectedFilters.onlyFavoriates,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: selectedFilters.all,
              ),
            ],
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      //GridView.builder helps in performance by rendering the grid only the screens
      body: ProductsGrid(_showOnlyFav),
    );
  }
}
