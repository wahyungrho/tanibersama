part of 'pages.dart';

class KatalogAllProgram extends StatelessWidget {
  final String? title;
  final List<ProgramModel> programModel;
  const KatalogAllProgram({Key? key, this.title, required this.programModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: greenColor),
          backgroundColor: Colors.transparent,
          title: Text(
            title!,
            style: const TextStyle(color: greenColor),
          )),
      body: GridView.builder(
          padding:
              EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16, mainAxisSpacing: 16, crossAxisCount: 2),
          itemCount: programModel.length,
          itemBuilder: (_, i) {
            final x = programModel[i];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailPage(
                              programModel: x,
                            )));
              },
              child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5, color: greyColor!.withOpacity(0.5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              Image.network(BaseURL.apiImage + "/${x.image}")),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(x.programName!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: mediumFontStyle),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(x.nameBorrower!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: regulerFontStyle.copyWith(fontSize: 12)),
                    ],
                  )),
            );
          }),
    );
  }
}
