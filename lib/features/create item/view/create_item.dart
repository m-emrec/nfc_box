import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nfc_box/features/create%20item/providers/providers.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import 'widgets/field_list.dart';
import 'widgets/image_container.dart';

class CreateItem extends ConsumerWidget {
  const CreateItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var addItem = 'Add Item';
    return PopScope(
      onPopInvokedWithResult: (didPop, result) =>
          ref.read(fieldListProvider).clear(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ImageContainer(),
                  Gap(AppPaddings.lPadding),
                  CustomTextField(
                    label: "Item Name",
                  ),
                  Gap(AppPaddings.lPadding),
                  FieldList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
