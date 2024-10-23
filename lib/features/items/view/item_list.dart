import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/core/utils/widgets/buttons/responsive_button.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_paddings.dart';

import '../model/item.dart';
import 'widgets/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  static const String boxes = 'Boxes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(boxes),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.createItem.name),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPaddings.sPadding / 2,
              horizontal: AppPaddings.xsPadding,
            ),
            child: ItemCard(
              item: Item(
                title: "My Gym Shoe",
                id: "",
                createdDate: DateTime(2024, 10, 12),
                imageUrl:
                    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
          );
        },
      ),
    );
  }
}
