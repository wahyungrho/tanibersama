part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final ProgramModel? programModel;
  const DetailPage({Key? key, this.programModel}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int unit = 1;
  bool? login;
  var refundTotal = 0.0;
  int refundValues = 0;
  String? contractDuration;

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    login = sharedPreferences.getBool(PrefProfile.login) ?? false;
    print("Status login $login ");
    setState(() {});
    defaultValuesSimulation('default');
  }

  void defaultValuesSimulation(String tipe) {
    if (tipe == "default") {
      refundValues = int.parse("${widget.programModel!.price}");
      contractDuration = "${widget.programModel!.contractDuration}";
      double marginValues = int.parse("${widget.programModel!.margin}") / 12;
      double marginContract = marginValues *
          int.parse(
              contractDuration!.substring(0, contractDuration!.length - 6));
      refundTotal = refundValues + (refundValues * marginContract / 100);
      setState(() {});
    } else if (tipe == "add") {
      refundValues = refundValues + int.parse("${widget.programModel!.price}");
      contractDuration = "${widget.programModel!.contractDuration}";
      double marginValues = int.parse("${widget.programModel!.margin}") / 12;
      double marginContract = marginValues *
          int.parse(
              contractDuration!.substring(0, contractDuration!.length - 6));

      refundTotal = refundValues + (refundValues * marginContract / 100);
    } else {
      refundValues = refundValues - int.parse("${widget.programModel!.price}");
      contractDuration = "${widget.programModel!.contractDuration}";
      double marginValues = int.parse("${widget.programModel!.margin}") / 12;
      double marginContract = marginValues *
          int.parse(
              contractDuration!.substring(0, contractDuration!.length - 6));
      refundTotal = refundValues - (refundValues * marginContract / 100);
    }
  }

  void incrementUnit() {
    setState(() {
      unit++;
      defaultValuesSimulation('add');
    });
  }

  void decrementUnit() {
    if (unit == 1) {
      setState(() {});
    } else {
      setState(() {
        unit--;
        defaultValuesSimulation('remove');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 250,
          elevation: 0,
          snap: true,
          floating: true,
          stretch: true,
          backgroundColor: Colors.grey.shade50,
          flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              background: Image.network(
                BaseURL.apiImage + "/${widget.programModel!.image}",
                fit: BoxFit.cover,
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              color: Colors.white.withOpacity(0.2),
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.programModel!.programName.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            shape: BoxShape.circle),
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
                              "${widget.programModel!.nameBorrower}",
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
                                  "${widget.programModel!.locationBorrower}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: regulerFontStyle.copyWith(
                                      fontSize: 12, color: greyColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    "Deskripsi",
                    style: mediumFontStyle.copyWith(
                        fontSize: 18, color: greenColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: greyColor!.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      widget.programModel!.description.toString(),
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.grey.shade800,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    "Rincian Pendanaan",
                    style: mediumFontStyle.copyWith(
                        fontSize: 18, color: greenColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: greyColor!.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Harga per unit",
                          style: regulerFontStyle.copyWith(
                              color: greyColor, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                NumberFormat.currency(
                                        decimalDigits: 0,
                                        locale: 'id_ID',
                                        symbol: 'Rp ')
                                    .format(int.parse(
                                        "${widget.programModel!.price}")),
                                style: boldFontStyle.copyWith(
                                    color: greenColor, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: mediumFontStyle.copyWith(
                                      fontSize: 12,
                                      color: greyColor!.withOpacity(0.7)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${widget.programModel!.unitRegistered} unit',
                                        style: mediumFontStyle.copyWith(
                                            fontSize: 12, color: greenColor)),
                                    const TextSpan(text: ' telah didanai'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Margin (p.a)",
                                            style: regulerFontStyle.copyWith(
                                              color: greyColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${widget.programModel!.margin}% per tahun",
                                            style: mediumFontStyle.copyWith(
                                                color: blackColor,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          height: 40,
                                          width: 1,
                                          color: greyColor!.withOpacity(0.5)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Durasi Kontrak",
                                            style: regulerFontStyle.copyWith(
                                              color: greyColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${widget.programModel!.contractDuration}",
                                            style: mediumFontStyle.copyWith(
                                                color: blackColor,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Periode Margin",
                                    style: regulerFontStyle.copyWith(
                                      color: greyColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "${widget.programModel!.periodeMargin}",
                                    style: mediumFontStyle.copyWith(
                                        color: blackColor, fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    "Simulasi",
                    style: mediumFontStyle.copyWith(
                        fontSize: 18, color: greenColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: greyColor!.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  height: 12,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          decimalDigits: 0,
                                          locale: 'id_ID',
                                          symbol: 'Rp ')
                                      .format(refundValues),
                                  style: boldFontStyle.copyWith(
                                      color: blackColor, fontSize: 20),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jumlah Unit",
                                  style: regulerFontStyle.copyWith(
                                      color: greyColor, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.5),
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 40,
                                  width: 120,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            decrementUnit();
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: (unit == 1)
                                                ? greyColor!.withOpacity(0.4)
                                                : Colors.yellow[700],
                                          )),
                                      Text(
                                        "$unit Unit",
                                        style: boldFontStyle.copyWith(
                                          color: blackColor,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            incrementUnit();
                                          },
                                          child: const Icon(Icons.add,
                                              size: 20, color: greenColor)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Estimasi Pengembalian",
                          style: regulerFontStyle.copyWith(
                              color: greyColor, fontSize: 12),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'id_ID',
                                    symbol: 'Rp ')
                                .format(refundTotal.toInt()),
                            style: boldFontStyle.copyWith(
                              color: blackColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                      } else {
                        print("Status login $login ");
                      }
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
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ))
        ])),
      ]),
    );
  }
}
