import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import '../providers/providers.dart';
import 'widgets/field_list.dart';
import 'widgets/image_container.dart';

class CreateItem extends ConsumerWidget {
  const CreateItem({super.key});

  static const String addItem = 'Add Item';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) =>
          ref.read(fieldListProvider).clear(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(addItem),
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
                  const FieldList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
