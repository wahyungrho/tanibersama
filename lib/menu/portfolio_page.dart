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
  AuthServices authServices = AuthServices();
  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(PrefProfile.idUSer);
    login = sharedPreferences.getBool(PrefProfile.login) ?? false;
    setState(() {});
    getUser();
  }

  getUser() async {
    listUser = await authServices.getUser(id!);
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5, color: greyColor!.withOpacity(0.5))),
                  child: const Center(
                      child: Text("MOHON MAAF ANDA BELUM MEMILIKI PENDANAAN")),
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
