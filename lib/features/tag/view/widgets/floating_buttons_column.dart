part of tag_detail_view;

/// This widget contains the save and add buttons
class _FloatingActionButtons extends StatelessWidget {
  final WidgetRef ref;
  const _FloatingActionButtons({
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Save button
        Visibility(
          visible: TagDetailProviders.isEdited(ref),
          child: FloatingActionButton.small(
            onPressed: () => context.goNamed(Routes.prepareNfc.name, extra: {
              'tag': ref.watch(TagDetailProviders.tagDetailViewModelProvider),
              "isWrite": true,
            }),
            backgroundColor: AppColors.secondaryTeal,
            child: const Icon(
              Icons.save_outlined,
            ),
          ),
        ),

        /// Add button
        FloatingActionButton(
          onPressed: () => CustomBottomSheet.show(
            context,
            widget: const AddItemBottomSheet(),
          ),
          child: const Icon(
            Icons.add,
          ),
        )
      ],
    );
  }
}
