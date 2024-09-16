import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/Helper/Service/onRunInit.dart';
import 'package:restaurant_management/Models/CartModels.dart';
import 'package:restaurant_management/View/StyleApp/SizeApp/SizeApp.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataApiController>(
      builder: (context, data, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isMobile ? 2 : 4,
            mainAxisSpacing: context.setHeight(2),
            crossAxisSpacing: context.setWidth(2),
            childAspectRatio: 3 / 4,
          ),
          itemCount: data.drinks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                // horizontal: context.setWidth(1),
                top: context.setHeight(8),
              ),
              child: Container(
                height: context.setHeight(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.setRadius(4)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      // spreadRadius: 5,
                      // blurRadius: 7,
                      // offset: Offset(1, 3),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: context.setHeight(6),
                      left: context.setWidth(1.5),
                      right: context.setWidth(1.5),
                      child: Image.network(
                        'https://moath.pointeam.org/cabtinwhatsapp/img/ricechk.jpeg',
                        width: context.setWidth(45),
                        height: context.setHeight(20),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: context.setHeight(3),
                      left: 2.8,
                      child: Text(
                        data.drinks[index]['txt'],
                        style: TextStyle(
                          fontSize: context.setFontSize(8),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(1.0, -2.0),
                              blurRadius: 4.0,
                              color: Colors.white,
                            ),
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: context.setHeight(0.5),
                      left: 1.8,
                      child: Text(
                        data.drinks[index]['id'],
                        style: TextStyle(
                          fontSize: context.setFontSize(8),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(1.0, -2.0),
                              blurRadius: 4.0,
                              color: Colors.white,
                            ),
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -4,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          data.addToCart(
                            Cartmodels(
                              name: data.drinks[index]['txt'],
                              price: double.parse(data.drinks[index]['id']),
                              quantity: 1,
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          size: context.setIconSize(8),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
