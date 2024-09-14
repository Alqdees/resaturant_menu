import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/View/StyleApp/SizeApp/SizeApp.dart';



class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataApiController>(
      builder: (context, cartProvider, child) {
        return Drawer(
          backgroundColor: Colors.yellow.shade100,
          elevation: 5,
          width: context.setWidth(75),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.carts.length,
                itemBuilder: (context, index) {
                  final product = cartProvider.carts[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toString()}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeFromCart(index);
                      },
                    ),
                  );
                },
              ),
            ),
            Text('Cart Total: \$${cartProvider.getAllPriceCart()}'),
            SizedBox(height: context.setHeight(1),)
          ]),
        );
      },
    );
  }
}