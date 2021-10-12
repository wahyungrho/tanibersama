part of 'menu.dart';

class PorfolioPage extends StatefulWidget {
  const PorfolioPage({Key? key}) : super(key: key);

  @override
  _PorfolioPageState createState() => _PorfolioPageState();
}

class _PorfolioPageState extends State<PorfolioPage> {
  bool? login;
  String? id = '';
  List<UserModel> listUser = [];
  List<PortfolioModel> listPorfolio = [];
  AuthServices authServices = AuthServices();
  PortfolioServices portfolioServices = PortfolioServices();
  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(PrefProfile.idUSer);
    login = sharedPreferences.getBool(PrefProfile.login) ?? false;
    setState(() {});
    getUserAndPortfolio();
  }

  getUserAndPortfolio() async {
    listUser = await authServices.getUser(id!);
    listPorfolio = await portfolioServices.getHistory(id!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: (login == true)
            ? Text(
                "Portfolio saya",
                style: TextStyle(color: blackColor),
              )
            : const SizedBox(),
      ),
      body: (login == true)
          ? ListView(
              children: [
                ListView.builder(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: listUser.length,
                    itemBuilder: (_, i) {
                      final x = listUser[i];
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 0.5,
                                    color: greyColor!.withOpacity(0.5))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Dana Dikelola",
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
                                          .format(
                                              int.parse("${x.totalPendanaan}")),
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
                                      "Akumulasi Margin",
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
                                          .format(
                                              int.parse("${x.totalMargin}")),
                                      style: boldFontStyle.copyWith(
                                          color: blackColor, fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                listPorfolio.isEmpty
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 0.5,
                                color: greyColor!.withOpacity(0.5))),
                        child: const Center(
                            child: Text(
                                "MOHON MAAF ANDA BELUM MEMILIKI PENDANAAN")),
                      )
                    : Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 0.5, color: greyColor!.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: listPorfolio.length,
                          itemBuilder: (_, i) {
                            final x = listPorfolio[i];
                            var status = '';
                            if (x.statusOrder == "0") {
                              status = "Mohon selesaikan pembayaran";
                            } else if (x.statusOrder == "1") {
                              status = "Pembayaran sedang dikonfirmasi";
                            } else {
                              if (x.status == "0") {
                                status = "Menunggu dana terkumpul";
                              } else if (x.status == "1") {
                                status = "Program sedang berjalan";
                              } else if (x.status == "2") {
                                status = "Menunggu pengembalian dana";
                              } else {
                                status = "Pendanaan telah dikembalikan";
                              }
                            }
                            return Container(
                              margin: EdgeInsets.fromLTRB(16, 16, 16,
                                  (i == listPorfolio.length - 1) ? 16 : 0),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 0.5,
                                      color: greyColor!.withOpacity(0.5))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "No Register",
                                        style: regulerFontStyle.copyWith(
                                            color: const Color(0xff979797)),
                                      ),
                                      Text(
                                        "ID${x.invoice}",
                                        style: mediumFontStyle.copyWith(
                                            color: blackColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Status",
                                        style: regulerFontStyle.copyWith(
                                            color: const Color(0xff979797)),
                                      ),
                                      Text(
                                        status,
                                        style: mediumFontStyle.copyWith(
                                            color: blackColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        margin: EdgeInsets.only(
                                            right: defaultMargin),
                                        decoration: BoxDecoration(
                                            color: greyColor!.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${BaseURL.apiImage}/${x.image}"),
                                                fit: BoxFit.cover),
                                            border: Border.all(
                                                width: 0.4,
                                                color: greyColor!
                                                    .withOpacity(0.5))),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              (4 * defaultMargin) -
                                              150,
                                          child: Text(
                                            x.programName!,
                                            style: mediumFontStyle.copyWith(
                                              color: blackColor,
                                              fontSize: 18,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total Dana Dikelola",
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
                                                .format(int.parse(
                                                    "${x.costInvest}")),
                                            style: boldFontStyle.copyWith(
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.4,
                                                color: greyColor!
                                                    .withOpacity(0.5))),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Akumulasi Margin",
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
                                                .format(
                                                    int.parse("${x.payback}")),
                                            style: boldFontStyle.copyWith(
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  (x.statusOrder == "0")
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              top: defaultMargin),
                                          child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ConfirmPaymentPage(
                                                            portfolioModel: x,
                                                          )));
                                            },
                                            height: 45,
                                            elevation: 0,
                                            splashColor: Colors.yellow[700],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            color: greenColor,
                                            child: const Center(
                                              child: Text(
                                                "Konfirmasi pembayaran",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            );
                          },
                        ),
                      )
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetIlustration(
                    image: "assets/auth_ilustration.png",
                    title: "Oops, login dulu yuk.",
                    subtitle1:
                        "Halaman ini memerlukan akses dari profile kamu,",
                    subtitle2: "silahkan login terlebih dahulu.",
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignInPage(
                                        currentPage: 'login',
                                        selectedIndex: 1,
                                      )));
                        },
                        height: 50,
                        elevation: 0,
                        splashColor: Colors.yellow[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: greenColor,
                        child: const Center(
                          child: Text(
                            "Login Sekarang",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
