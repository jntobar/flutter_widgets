

import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final IconData icon;
  final String link;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.link,
  });
}


const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    icon: Icons.smart_button_outlined,
    link: '/buttons',
  ),
  MenuItems(
    title: 'Tarjetas',
    subTitle: 'Varios tipos de tarjetas en flutter',
    icon: Icons.credit_card,
    link: '/cards',
  ),
  MenuItems(
    title: 'Form',
    subTitle: 'Form Page',
    icon: Icons.edit_note_outlined,
    link: '/forms',
  ),
  MenuItems(
    title: 'ListView',
    subTitle: 'ListView Page',
    icon: Icons.list_alt_outlined,
    link: '/listview',
  ),
  MenuItems(
    title: 'ProgressIndicator',
    subTitle: 'Progress y ControladosPage',
    icon: Icons.refresh_outlined,
    link: '/progress',
    
  ),
   MenuItems(
    title: 'SnackBars y dialogos',
    subTitle: 'Snackbar indicadores',
    icon: Icons.input_outlined,
    link: '/snackbars',
    
  ),
  MenuItems(
    title: 'Animated container',
    subTitle: 'animated',
    icon: Icons.check_box_outline_blank_outlined,
    link: '/animated',
    
  ),
  MenuItems(
    title: 'UI control + Tiles',
    subTitle: 'ui-control',
    icon: Icons.car_rental_outlined,
    link: '/ui-control',
    
  ),


];