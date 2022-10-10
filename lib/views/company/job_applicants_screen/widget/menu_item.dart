import 'package:tawzeef/controller/consts/exports.dart';

class PopMenuItem extends ConsumerWidget {
  final Function onApply, onReject, onReview;
  PopMenuItem({
    Key? key,
    required this.onApply,
    required this.onReject,
    required this.onReview,
  }) : super(key: key);

  final ChangeNotifierProvider<MyJobItemModel> myJobItemController =
      ChangeNotifierProvider((ref) => MyJobItemModel());

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(myJobItemController);
    return CustomPopupMenu(
      controller: controller.popupMenuController,
      showArrow: false,
      barrierColor: Colors.black26,
      menuBuilder: () {
        return Container(
          width: 120,
          padding: EdgeInsets.all(spaces.space12),
          decoration: BoxDecoration(
            color: coolors.white,
            border: Border.all(
              color: coolors.primaryColor,
              width: 0.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconItem(
                icon: svgs.correctCheck,
                title: context.localization?.apply,
                onTap: () {
                  controller.close();
                  onApply();
                },
              ),
              Divider(color: coolors.primaryColor)
                  .mPadding(vertical: spaces.space8),
              IconItem(
                icon: svgs.delete,
                title: context.localization?.reject,
                onTap: () {
                  controller.close();
                  onReject();
                },
              ),
              Divider(color: coolors.primaryColor)
                  .mPadding(vertical: spaces.space8),
              IconItem(
                icon: svgs.inreview,
                title: context.localization?.inReview,
                onTap: () {
                  controller.close();
                  onReview();
                },
              )
            ],
          ),
        );
      },
      pressType: PressType.singleClick,
      child: MSvg(
        name: svgs.options,
        width: 20,
        height: 20,
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  final String? title;
  final String icon;
  final Function onTap;
  const IconItem({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MSvg(
          name: icon,
          height: 20,
        ).mPadding(end: spaces.space8),
        MText(
          text: title,
          fontColor: coolors.primaryColor,
          fontFamily: foontFamily.tajawalBold,
          fontSize: foontSize.font16,
        )
      ],
    ).mAddAction(onTap: onTap);
  }
}
