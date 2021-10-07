part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final String? totalTransfer;
  const PaymentPage({Key? key, this.totalTransfer}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? userName = '';
  String? phone = '';
  List<UserModel>? userModel = [];
  String? id = '';

  AuthServices authServices = AuthServices();

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(PrefProfile.idUSer);
    setState(() {});
    getUser();
  }

  getUser() async {
    userModel = await authServices.getUser(id!);
    userName = userModel![0].fullName;
    phone = userModel![0].phone;
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: (4 * defaultMargin)),
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                height: 100,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: greenColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8))),
                child: Text(
                  "$userName ($phone)",
                  style: mediumFontStyle.copyWith(color: Colors.white),
                )),
            Positioned(
              top: 45,
              child: Container(
                  width:
                      MediaQuery.of(context).size.width - (2 * defaultMargin),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Silahkan lakukan pembayaran",
                        style: mediumFontStyle.copyWith(color: blackColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.payment_rounded,
                            color: blackColor.withOpacity(0.6),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Transfer ke",
                            style: regulerFontStyle.copyWith(color: blackColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rudi Setiawan",
                            style: regulerFontStyle.copyWith(color: blackColor),
                          ),
                          SizedBox(
                            width: 80,
                            child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/9/97/Logo_BRI.png'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: greyColor!.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "9173489172",
                          style: mediumFontStyle.copyWith(
                              color: blackColor.withOpacity(0.7)),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Total transfer",
                        style: regulerFontStyle.copyWith(color: blackColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: greyColor!.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          NumberFormat.currency(
                                  decimalDigits: 0,
                                  locale: 'id_ID',
                                  symbol: 'Rp ')
                              .format(int.parse("${widget.totalTransfer}")),
                          style: mediumFontStyle.copyWith(
                              color: blackColor.withOpacity(0.7)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Positioned(
              bottom: 80,
              child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MainPage(
                                      selectedIndex: 1,
                                    )),
                            (route) => false);
                      },
                      height: 45,
                      elevation: 0,
                      splashColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: greenColor,
                      child: const Center(
                        child: Text(
                          "Konfirmasi Pembayaran",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage(
                                      selectedIndex: 0,
                                    )));
                      },
                      child: Text(
                        "Kembali ke Halaman Utama",
                        style: regulerFontStyle.copyWith(color: greenColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSuccess extends StatefulWidget {
  final String? totalTransfer;
  const OrderSuccess({Key? key, this.totalTransfer}) : super(key: key);

  @override
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => PaymentPage(
                    totalTransfer: widget.totalTransfer,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetIlustration(
              image: "assets/order_success.png",
              title: "Yeay, Proses investasi berhasil.",
              subtitle1: "Mohon tunggu sebentar,",
              subtitle2: "Halaman ini akan menuju ke detail pembayaran.",
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Center(
                  child: CircularProgressIndicator(color: greenColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
