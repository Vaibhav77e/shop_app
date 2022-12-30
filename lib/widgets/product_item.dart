import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final newproduct = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            // add btn to left
            leading: Consumer<Product>(
              builder: ((context, value, child) => IconButton(
                    onPressed: () {
                      newproduct.toggleFavoriatesStatus();
                    },
                    icon: newproduct.isFavoriates
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                    //color: Theme.of(context).colorScheme.secondary,
                    color: Colors.amber,
                  )),
            ),
            title: Text(
              newproduct.title,
              textAlign: TextAlign.center,
            ),
            //adds btn to right
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
            ),
          ),
          child: Image.network(
            newproduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routeNamed,
              arguments: newproduct.id);
        },
      ),
    );
  }
}
