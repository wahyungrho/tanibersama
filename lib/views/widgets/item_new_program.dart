part of 'widgets.dart';

class ItemNewProgram extends StatelessWidget {
  final ProgramModel? programModel;
  const ItemNewProgram({Key? key, this.programModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.72 / 3,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.5, color: greyColor!.withOpacity(0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.network(
                    "${BaseURL.apiImage}/${programModel!.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      programModel!.programName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: mediumFontStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text.rich(
                    TextSpan(
                        text: "${programModel!.unitRegistered} ",
                        style: boldFontStyle.copyWith(
                            color: greenColor, fontSize: 13),
                        children: [
                          TextSpan(
                            text: "telah didanai, sisa",
                            style: regulerFontStyle.copyWith(
                                color: blackColor.withOpacity(0.6),
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: " ${programModel!.unitAvailable}",
                            style: boldFontStyle.copyWith(
                                color: greenColor, fontSize: 13),
                          ),
                          TextSpan(
                            text: " lagi",
                            style: regulerFontStyle.copyWith(
                                color: blackColor.withOpacity(0.6),
                                fontSize: 12),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Margin (p.a)",
                            style: regulerFontStyle.copyWith(
                                color: greyColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${programModel!.margin}% per tahun",
                            style: mediumFontStyle.copyWith(
                                color: blackColor, fontSize: 13),
                          ),
                        ],
                      ),
                      Container(
                          height: 40,
                          width: 1,
                          color: greyColor!.withOpacity(0.5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Durasi Kontrak",
                            style: regulerFontStyle.copyWith(
                                color: greyColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${programModel!.contractDuration}",
                            style: mediumFontStyle.copyWith(
                                color: blackColor, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
