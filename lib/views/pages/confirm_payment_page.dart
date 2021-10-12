part of 'pages.dart';

class ConfirmPaymentPage extends StatefulWidget {
  final PortfolioModel? portfolioModel;
  const ConfirmPaymentPage({Key? key, this.portfolioModel}) : super(key: key);

  @override
  _ConfirmPaymentPageState createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  File? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberAccountController = TextEditingController();
  ConfirmPaymentServices confirmPaymentServices = ConfirmPaymentServices();
  @override
  Widget build(BuildContext context) {
    Widget noInvoice() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Row(
              children: [
                Text("Nomor invoice : ",
                    style: regulerFontStyle.copyWith(
                        color: const Color(0xff979797), fontSize: 16)),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.portfolioModel!.invoice.toString(),
                  style: mediumFontStyle.copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Image.asset('assets/line_divider.png'),
          ],
        ),
      );
    }

    Widget fotoTransfer() {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Foto bukti transfer",
                style: mediumFontStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  image = await getImage();
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: greenColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    child: image == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_circle,
                                color: greenColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "Tambahkan Photo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12, color: greenColor),
                                ),
                              )
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            )),
                  ),
                ),
              ),
            ],
          ));
    }

    Widget nameAccount() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Pemilik Rekening",
              style: mediumFontStyle.copyWith(fontSize: 16),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: greenColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Cth: Burhanudin",
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget numberAccount() {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor Rekening",
              style: mediumFontStyle.copyWith(fontSize: 16),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: greenColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: numberAccountController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Cth: 1122310920",
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: blackColor),
          title: Text(
            "Konfirmasi pembayaran",
            style: TextStyle(color: blackColor),
          )),
      body: ListView(
        children: [
          noInvoice(),
          fotoTransfer(),
          nameAccount(),
          numberAccount(),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 30),
            child: MaterialButton(
              onPressed: () async {
                if (image == null ||
                    nameController.text.isEmpty ||
                    numberAccountController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Maaf, mohon lengkapi form konfirmasi pembayaran !',
                      style: mediumFontStyle.copyWith(
                          color: blackColor.withOpacity(0.8)),
                    ),
                    backgroundColor: Colors.amber[400],
                  ));
                } else {
                  var confirmPayment =
                      await confirmPaymentServices.confirmPayment(
                          widget.portfolioModel!.invoice.toString(),
                          nameController.text,
                          numberAccountController.text,
                          image!);

                  if (confirmPayment == false) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Maaf, konfirmasi pembayaran gagal!',
                        style: mediumFontStyle.copyWith(
                            color: blackColor.withOpacity(0.8)),
                      ),
                      backgroundColor: Colors.amber[400],
                    ));
                  } else {
                    NotificationAPI.showNotification(
                      title: 'Konfirmasi pembayaran berhasil',
                      body:
                          'Selanjutnya, program akan berjalan sampai pendanaan telah terkumpul...',
                      payload: 'Silahkan lakukan pembayaran',
                    );
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ConfirmPaymentSuccess()));
                  }
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
                  "Konfirmasi pembayaran",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmPaymentSuccess extends StatefulWidget {
  const ConfirmPaymentSuccess({Key? key}) : super(key: key);

  @override
  State<ConfirmPaymentSuccess> createState() => _ConfirmPaymentSuccessState();
}

class _ConfirmPaymentSuccessState extends State<ConfirmPaymentSuccess> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => const MainPage(
                    selectedIndex: 1,
                  )),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetIlustration(
                image: "assets/order_success.png",
                title: "Yeay, Proses konfirmasi pembayaran berhasil.",
                subtitle1: "Mohon tunggu sebentar,",
                subtitle2: "Halaman ini akan menuju ke halaman portfolio anda.",
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
      ),
    );
  }
}
