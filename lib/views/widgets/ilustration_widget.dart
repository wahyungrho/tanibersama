part of 'widgets.dart';

class WidgetIlustration extends StatelessWidget {
  final Widget? child;
  final String? image;
  final String? title;
  final String? subtitle1;
  final String? subtitle2;
  const WidgetIlustration(
      {Key? key,
      this.child,
      this.image,
      this.title,
      this.subtitle1,
      this.subtitle2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image!,
          width: 250,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          title!,
          style: regulerFontStyle.copyWith(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          children: [
            Text(
              subtitle1!,
              style: regulerFontStyle.copyWith(fontSize: 15, color: greyColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              subtitle2!,
              style: regulerFontStyle.copyWith(fontSize: 15, color: greyColor),
            ),
            const SizedBox(
              height: 40,
            ),
            child ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}
