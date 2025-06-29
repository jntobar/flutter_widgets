import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex= 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top>35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex=value;
        });
        final menuItems = appMenuItems[value];
        context.push(menuItems.link);

        widget.scaffoldKey.currentState?.closeDrawer();



      },
      children: [
        Padding(padding: EdgeInsets.fromLTRB(28,hasNotch ? 20 : 40,26,10),
        child: Text('Welcome John'),),

        ...appMenuItems.map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label:  Text(item.title)) ,),




        //NavigationDrawerDestination(icon: Icon(Icons.ssid_chart), label: const Text('Holamundo')),
        

        Padding(padding: EdgeInsets.fromLTRB(28,15,28,10),
        child: Divider(),
        ),

        Padding(padding: EdgeInsets.fromLTRB(28,hasNotch ? 20 : 40,26,10),
        child: Text('Mas opciones'),),
        NavigationDrawerDestination(icon: Icon(Icons.wb_twilight_sharp), label: const Text('Otro widget ')),
         ...appMenuItems
         .sublist(4)
         .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label:  Text(item.title)) ,),
      ]);
  }
}