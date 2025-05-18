import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final IconData? icon;
  final bool isNew;
  final bool isSection;

  MenuItemModel({
    required this.title,
    this.icon,
    this.isNew = false,
    this.isSection = false,
  });

  final List<MenuItemModel> menuItems = [
    MenuItemModel(title: 'Edit Profile', icon: Icons.person, isSection: true),
    MenuItemModel(title: 'My Orders'),
    MenuItemModel(title: 'My Addresses'),
    MenuItemModel(title: 'Wallet', isNew: true),
    MenuItemModel(title: 'Favorites'),
    MenuItemModel(title: 'Sharing', icon: Icons.group, isSection: true),
    MenuItemModel(title: 'Invite Friends'),
    MenuItemModel(title: 'Settings', icon: Icons.settings, isSection: true),
    MenuItemModel(title: 'Language'),
    MenuItemModel(
        title: 'Help Center', icon: Icons.help_outline, isSection: true),
    MenuItemModel(title: 'Privacy Policy'),
  ];
}
