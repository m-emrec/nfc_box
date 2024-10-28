import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_toast.dart';
import '../../../../core/utils/models/field_model.dart';
import '../../providers/providers.dart';
import '../widgets/choose image container/image_container.dart';
import '../widgets/field_list.dart';
import '../widgets/fields/choose field type/choose_field_type_sheet.dart';

part 'utils.dart';

class CreateItemPage extends ConsumerWidget {
  const CreateItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _CreateItemUtils.clear(ref),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_CreateItemUtils.addItem),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: FAB(
          onPressed: () => _CreateItemUtils.onSave(context, ref),
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
                        _CreateItemUtils.onAddField(context, ref),
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
