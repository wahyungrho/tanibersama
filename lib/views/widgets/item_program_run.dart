part of 'widgets.dart';

class ItemProgramRun extends StatelessWidget {
  final ProgramModel? programModel;
  const ItemProgramRun({Key? key, this.programModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width - (2 * defaultMargin),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(
                        BaseURL.apiImage + "/${programModel!.image}"),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "${programModel!.programName}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: mediumFontStyle.copyWith(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              height: 35,
              width: 35,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1), shape: BoxShape.circle),
              child: const Icon(
                Icons.corporate_fare_rounded,
                size: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    "${programModel!.nameBorrower}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: mediumFontStyle,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 16,
                      color: greyColor,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width: 270,
                      child: Text(
                        "${programModel!.locationBorrower}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: regulerFontStyle.copyWith(
                            fontSize: 12, color: greyColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
