import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../model/field_model.dart';
import '../providers/providers.dart';
import 'widgets/field_list.dart';
import 'widgets/fields/choose field type/choose_field_type_sheet.dart';
import 'widgets/image_container.dart';

class CreateItem extends ConsumerWidget {
  const CreateItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) =>
          _CreateItemUtils.clearFieldList(ref),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_CreateItemUtils.addItem),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
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
                  /// Image container to choose a image
                  const ImageContainer(),
                  Gap(AppPaddings.lPadding),

                  /// This is the text field for the item name
                  CustomTextField(
                    label: _CreateItemUtils.itemName,
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

  static void clearFieldList(WidgetRef ref) {
    ref.read(fieldListProvider).clear();
  }

  static void onTabPressed(BuildContext context, WidgetRef ref) async {
    /// check if the fieldList is not empty
    /// if the fieldList is not empty then check if the last field is empty
    /// if the last field is empty then show a error toast
    if (ref.watch(fieldListProvider).isNotEmpty) {
      final FieldModel lastField = ref.watch(fieldListProvider).last;
      if (lastField.fieldNameController.text.isEmpty ||
          lastField.fieldController.text.isEmpty) {
        Toast.errToast(desc: 'Field name and field value cannot be empty');
        return;
      }
    }

    ///  else show the bottom sheet
    await showBottomSheet(context);
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
