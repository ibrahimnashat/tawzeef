import 'package:tawzeef/controller/consts/exports.dart';

class PopMenuItem extends ConsumerWidget {
  final Color? iconColor;
  final Function onEdit;
  PopMenuItem({
    Key? key,
    this.iconColor,
    required this.onEdit,
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
                icon: svgs.edit,
                title: context.localization?.editJob,
                onTap: () {
                  controller.close();
                  onEdit();
                },
              ),
            ],
          ),
        );
      },
      pressType: PressType.singleClick,
      child: MSvg(
        name: svgs.options,
        color: iconColor ?? coolors.primaryColor,
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
