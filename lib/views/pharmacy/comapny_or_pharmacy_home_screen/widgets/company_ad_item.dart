import 'package:tawzeef/shared/consts/exports.dart';

class CompanyAdItem extends StatelessWidget {
  final AdModel ad;
  const CompanyAdItem({
    Key? key,
    required this.ad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          width: context.w * 0.9,
          child: Stack(
            children: [
              PositionedDirectional(
                bottom: 0,
                top: 0,
                start: 0,
                end: 0,
                child: MNetworkImage(
                  url: ad.image ?? '',
                  fit: BoxFit.cover,
                  borderRadius: 25,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(spaces.space12),
                  margin: EdgeInsets.symmetric(
                    vertical: spaces.space5,
                    horizontal: spaces.space5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: MText(
                    text: ad.title,
                    fontSize: foontSize.font18,
                    maxLines: 2,
                    maxWidth: context.w * 0.8,
                  ),
                ),
              ),
            ],
          ),
        ).mPadding(horizontal: spaces.space24),
        Divider(
          endIndent: spaces.space5,
          indent: spaces.space5,
        ).mPadding(vertical: spaces.space5)
      ],
    );
  }
}
