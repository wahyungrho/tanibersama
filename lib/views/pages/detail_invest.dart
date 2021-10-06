part of 'pages.dart';

class DetailInvest extends StatefulWidget {
  final ProgramModel? programModel;
  final int? unit;
  final int? pendanaan;
  final int? totalRefund;
  const DetailInvest(
      {Key? key,
      this.programModel,
      this.unit,
      this.pendanaan,
      this.totalRefund})
      : super(key: key);

  @override
  _DetailInvestState createState() => _DetailInvestState();
}

class _DetailInvestState extends State<DetailInvest> {
  bool? login = false;
  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    login = sharedPreferences.getBool(PrefProfile.login) ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    int totalMargin = (widget.totalRefund! - widget.pendanaan!);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(defaultMargin),
          children: [
            Text(
              "Detail Pendanaan",
              style: mediumFontStyle.copyWith(fontSize: 18, color: greenColor),
            ),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 0.5, color: greyColor!.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (4 * defaultMargin) -
                              150,
                          child: Text(
                            widget.programModel!.programName!,
                            style: mediumFontStyle.copyWith(
                              color: blackColor,
                              fontSize: 16,
                            ),
                          )),
                      Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: greyColor,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${BaseURL.apiImage}/${widget.programModel!.image}"))))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Total Unit",
                    style: regulerFontStyle.copyWith(
                        color: greyColor, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.unit.toString() + " Unit",
                    style:
                        boldFontStyle.copyWith(color: blackColor, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Pendanaan",
                            style: regulerFontStyle.copyWith(
                                color: greyColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'id_ID',
                                    symbol: 'Rp ')
                                .format(widget.pendanaan),
                            style: boldFontStyle.copyWith(
                                color: blackColor, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.4,
                                color: greyColor!.withOpacity(0.5))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Margin",
                            style: regulerFontStyle.copyWith(
                                color: greyColor, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'id_ID',
                                    symbol: 'Rp ')
                                .format(totalMargin),
                            style: boldFontStyle.copyWith(
                                color: blackColor, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal:
                    BorderSide(width: 1, color: greyColor!.withOpacity(0.5)))),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pembayaran",
                  style: regulerFontStyle.copyWith(color: greyColor),
                ),
                Text(
                  NumberFormat.currency(
                          decimalDigits: 0, locale: 'id_ID', symbol: 'Rp ')
                      .format(widget.pendanaan),
                  style: mediumFontStyle.copyWith(color: blackColor),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pengembalian",
                  style: regulerFontStyle.copyWith(color: greyColor),
                ),
                Text(
                  NumberFormat.currency(
                          decimalDigits: 0, locale: 'id_ID', symbol: 'Rp ')
                      .format(widget.totalRefund),
                  style: mediumFontStyle.copyWith(color: blackColor),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                if (login == false) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SignInPage(
                                currentPage: 'detail',
                                method: getPreference,
                              )));
                } else {}
              },
              height: 50,
              elevation: 0,
              splashColor: Colors.yellow[700],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: greenColor,
              child: const Center(
                child: Text(
                  "Investasi Sekarang",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
