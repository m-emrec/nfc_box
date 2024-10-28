import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:ticker_text/ticker_text.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/models/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });
  final Item item;
  final Duration _textAnimationDuration = const Duration(milliseconds: 500);
  final int _textFlowSpeed = 40;

  @override
  Widget build(BuildContext context) {
    bool imageExist = item.imageUrl != null;
    double width = context.screenSize.width;
    double height = context.screenSize.height * .1;

    return Card(
      color: AppColors.neutralBackgroundLight[50],
      elevation: 5,
      shadowColor: AppColors.neutralBackgroundLight[20],
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _image(imageExist, height),
                  MaxGap(AppPaddings.xxsPadding),
                  _title(context),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: AppPaddings.xsPadding,
                bottom: AppPaddings.xsPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  _removeButton(),
                  const Spacer(),
                  _date(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _date(BuildContext context) {
    return Text(
      DateFormat.yMMM().format(item.createdDate ?? DateTime.now()),
      style: context.textTheme.bodySmall?.copyWith(
        color: AppColors.neutralGray500[50],
      ),
    );
  }

  CircleAvatar _removeButton() {
    return CircleAvatar(
      radius: 16,
      backgroundColor: AppColors.accentError[50],
      child: Image.asset(
        AppAssets.removeBoxPath,
        color: Colors.white,
      ),
    );
  }

  Visibility _image(bool imageExist, double height) {
    return Visibility(
      visible: imageExist,
      child: Image.network(
        item.imageUrl ?? "",
        fit: BoxFit.cover,
        width: height,
        height: height,
      ),
    );
  }

  Flexible _title(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: TickerText(
        speed: _textFlowSpeed,
        endPauseDuration: _textAnimationDuration,
        startPauseDuration: _textAnimationDuration,
        child: Text(
          item.itemName ?? "",
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
