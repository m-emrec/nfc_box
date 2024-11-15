import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/logger.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/enums/item_field_names.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/field_model.dart';
import '../../../../core/utils/models/item.dart';
import '../../../../core/utils/widgets/buttons/buttons_import.dart';
import '../../../../core/utils/widgets/custom bottom sheet/custom_bottom_sheet.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_toast.dart';
import '../../../items/providers/providers.dart';
import '../../providers/providers.dart';
import '../widgets/choose image container/choose_image_container.dart';
import '../widgets/field_list.dart';
import '../widgets/fields/choose field type/choose_field_type_sheet.dart';
import '../widgets/fields/color field/color_field.dart';
import '../widgets/fields/date field entry/date_field_entry.dart';
import '../widgets/fields/text_field_entry.dart';

part 'create_item_utils.dart';

class CreateItemPage extends ConsumerStatefulWidget {
  final Item? item;
  const CreateItemPage({super.key, this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends ConsumerState<CreateItemPage>
    with _CreateItemUtils {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addItem),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FAB(
        onPressed: () => onSave(context, ref),
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
                  controller: imageController,
                ),
                Gap(AppPaddings.lPadding),

                /// This is the text field for the item name
                CustomTextField(
                  label: itemName,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter item name' : null,
                  controller: itemNameController,
                ),
                Gap(AppPaddings.sPadding),

                ///list of fields
                const FieldList(),

                ///button to add a field
                ResponsiveElevatedButton(
                  onPressed: () async => onAddField(context, ref),
                  isPrimary: false,
                  child: Text(addField),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
