import 'package:flutter/material.dart';
import 'package:receitas_du_cheff/components/image_rounded.dart';
import 'package:receitas_du_cheff/utils/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  final String routeName;

  CustomDrawer({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  final List<Map<String, Object>> _itemsMenu = [
    {
      "title": "Login",
      "icon": Icons.login,
      "routeName": AppRoutes.login,
    },
    {
      "title": "Refeições",
      "icon": Icons.restaurant_rounded,
      "routeName": AppRoutes.homeRoute,
    },
    {
      "title": "Filtros",
      "icon": Icons.filter_alt_rounded,
      "routeName": AppRoutes.filters,
    },
    {
      "title": "Sobre",
      "icon": Icons.info,
      "routeName": AppRoutes.sobre,
    },
  ];
  
  get context => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.orange, // Define o fundo do Container como laranja
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _createNavigationHeader(context),
                ..._itemsMenu
                    .getRange(0, _itemsMenu.length - 1)
                    .map((menuItem) {
                  return _createItem(
                    menuItem["icon"] as IconData,
                    menuItem["title"] as String,
                    menuItem["routeName"] == routeName,
                    () => Navigator.of(context)
                        .pushReplacementNamed(menuItem["routeName"] as String),
                  );
                }).toList()
              ],
            ),
            _createRoundedItem(
              _itemsMenu.last["icon"] as IconData,
              _itemsMenu.last["title"] as String,
              _itemsMenu.last["routeName"] == routeName,
              () => Navigator.of(context)
                  .pushReplacementNamed(_itemsMenu.last["routeName"] as String),
              10, // Raio da borda ajustado para 10
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _createNavigationHeader(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: ImageRounded(
              radiusTop: 250,
              radiusBottom: 250,
              assetImage: "assets/images/logo.jpg",
              width: 0,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Receitas Du Cheff",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "RobotoCondensed",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 ListTile _createItem(
  IconData icon, String label, bool isSelected, void Function() onTap) {
  return ListTile(
    selected: isSelected,
    leading: Icon(
      icon,
      size: 24,
      color: Colors.black,
    ),
    title: Text(
      label,
      style: const TextStyle(
        fontFamily: "RobotoCondensed",
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    onTap: () {
      if (label == "Sobre") {
        Navigator.of(context as BuildContext).pushReplacementNamed(AppRoutes.sobre); // Navega para a página Sobre
      } else {
        onTap();
      }
    },
  );
}

  Widget _createRoundedItem(IconData icon, String label, bool isSelected,
      void Function() onTap, double radius) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
        color: isSelected
            ? const Color.fromARGB(255, 243, 243, 243)
            : Colors.transparent,
      ),
      child: Column(
        children: [
          ListTile(
            selected: isSelected,
            leading: Icon(
              icon,
              size: 24,
              color: Colors.black,
            ),
            title: Text(
              label,
              style: const TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            onTap: onTap,
          ),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white
                  : Colors.transparent, // Altera a cor da borda
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
