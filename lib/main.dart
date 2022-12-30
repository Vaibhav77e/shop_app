import 'package:flutter/material.dart';
import './screens/product_overview.dart';
import './screens/product_detail_screen.dart';
import './providers/providers_product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //instance of provided class
      create: (context) => ProvidersProduct(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverview(),
        routes: {
          ProductDetailScreen.routeNamed: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
