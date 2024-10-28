import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../model/field_model.dart';
import '../providers/providers.dart';
import 'widgets/choose image container/image_container.dart';
import 'widgets/field_list.dart';
import 'widgets/fields/choose field type/choose_field_type_sheet.dart';

class CreateItem extends ConsumerWidget {
  const CreateItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _CreateItemUtils.clear(ref),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_CreateItemUtils.addItem),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _CreateItemUtils.onTapSave(context, ref),
          child: const Icon(Icons.check),
        ),
        body: Padding(
          padding: AppPaddings.authHPadding,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Image container to choose a image
                  ChooseImageContainer(
                    controller: _CreateItemUtils.imageController,
                  ),
                  Gap(AppPaddings.lPadding),

                  /// This is the text field for the item name
                  CustomTextField(
                    label: _CreateItemUtils.itemName,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter item name' : null,
                    controller: _CreateItemUtils.itemNameController,
                  ),
                  Gap(AppPaddings.lPadding),

                  ///list of fields
                  const FieldList(),

                  ///button to add a field
                  ResponsiveElevatedButton(
                    onPressed: () async =>
                        _CreateItemUtils.onTabPressed(context, ref),
                    isPrimary: false,
                    child: const Text(_CreateItemUtils.addField),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// This class contains the properties for the CreateItem widget
final class _CreateItemUtils {
  static const String addField = 'Add Field';
  static const String addItem = 'Add Item';
  static const String itemName = 'Item Name';
  static TextEditingController imageController = TextEditingController();
  static TextEditingController itemNameController = TextEditingController();

  /// Clear the text fields and the fieldList
  static void clear(WidgetRef ref) {
    ref.read(fieldListProvider).clear();
    itemNameController.clear();
    imageController.clear();
  }

  static Future onTapSave(BuildContext context, WidgetRef ref) async {
    bool isValid = validate(context, ref);
    if (isValid) {
      await ref
          .read(createItemProvider.notifier)
          .createItem(
            itemName: itemNameController.text,
            image: imageController.text,
            fields: ref.watch(fieldListProvider),
          )

          /// if the dataState is DataSuccess then pop the screen
          .then((dataState) {
        if (dataState is DataSuccess) {
          if (context.mounted) {
            context.pop();
          }
        }
      });
    }
  }

  /// Validate the fields
  /// if the fieldList is not empty then check if the last field is empty
  /// if the last field is empty then show a error toast
  /// check if the item name is empty
  /// if the item name is empty then show a error toast
  /// return true if all the fields are valid
  static bool validate(BuildContext context, WidgetRef ref) {
    /// check if the fieldList is not empty
    /// if the fieldList is not empty then check if the last field is empty
    /// if the last field is empty then show a error toast
    if (ref.watch(fieldListProvider).isNotEmpty) {
      final FieldModel lastField = ref.watch(fieldListProvider).last;
      if (lastField.fieldNameController.text.isEmpty ||
          lastField.fieldController.text.isEmpty) {
        Toast.errToast(desc: 'Field name and field value cannot be empty');
        return false;
      }
    }

    /// check if the item name is empty
    if (itemNameController.text.isEmpty) {
      Toast.errToast(desc: 'Item name cannot be empty');
      return false;
    }
    return true;
  }

  static void onTabPressed(BuildContext context, WidgetRef ref) async {
    bool isValid = validate(context, ref);
    if (isValid) {
      await showBottomSheet(context);
    }
  }

  /// Show [ChooseFieldTypeSheet] bottom sheet
  static Future<void> showBottomSheet(
    BuildContext context,
  ) async {
    await CustomBottomSheet.show(
      context,
      widget: const ChooseFieldTypeSheet(),
    );
  }
}
