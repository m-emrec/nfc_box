import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';
import 'package:nfc_box/config/routes/router.dart';

import '../../../../core/constants/app_paddings.dart';
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
        title: Text(pageTitle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FAB(
        onPressed: () async => await onSave(context, ref),
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
                  isEdit: isEdit,
                ),
                Gap(AppPaddings.lPadding),

                /// This is the text field for the item name
                CustomTextField(
                  label: itemName,
                  validator: itemNameValidator,
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
