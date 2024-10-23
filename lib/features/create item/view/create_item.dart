import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import 'widgets/field_list.dart';
import 'widgets/image_container.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({super.key});

  @override
  Widget build(BuildContext context) {
    var addItem = 'Add Item';
    return Scaffold(
      appBar: AppBar(
        title: Text(addItem),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
      body: Padding(
        padding: AppPaddings.authHPadding,
        child: SafeArea(
          child: Column(
            children: [
              ImageContainer(),
              MaxGap(AppPaddings.lPadding),
              CustomTextField(
                label: "Item Name",
              ),
              MaxGap(AppPaddings.lPadding),
              const FieldList(),
            ],
          ),
        ),
      ),
    );
  }
}
