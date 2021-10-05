part of 'pages.dart';

class PinAuthPage extends StatefulWidget {
  final String? currentPage;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;
  final VoidCallback? method;
  const PinAuthPage({
    Key? key,
    this.currentPage,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.method,
  }) : super(key: key);

  @override
  _PinAuthPageState createState() => _PinAuthPageState();
}

class _PinAuthPageState extends State<PinAuthPage> {
  String currentText = '';
  AuthServices authServices = AuthServices();
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Current Page : ${widget.currentPage}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: greenColor.withOpacity(0.8)),
            ),
          ),
          Positioned(
            top: -70,
            left: -70,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: greenColor.withOpacity(0.4)),
            ),
          ),
          Positioned(
            top: 50,
            right: -20,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: greenColor.withOpacity(0.8)),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: greenColor.withOpacity(0.4)),
            ),
          ),
          SafeArea(
              child: ListView(
            padding: EdgeInsets.all(defaultMargin),
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                (widget.currentPage == "register")
                    ? "Tentukan PIN kamu untuk Autentikasi"
                    : "Masukkan PIN Autentikasi",
                style: mediumFontStyle.copyWith(
                  color: blackColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              (widget.currentPage == "register")
                  ? Text(
                      "Catatan : PIN ini digunakan untuk autentikasi ketika kamu login atau mengakses aplikasi, jangan berikan PIN ini ke orang lain atau melupakannya.",
                      style: mediumFontStyle.copyWith(
                        color: greyColor!.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    )
                  : Text(
                      "Catatan : Masukkan PIN yang telah kamu daftarkan pada saat registrasi akun.",
                      style: mediumFontStyle.copyWith(
                        color: greyColor!.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              PinCodeTextField(
                controller: pinController,
                appContext: context,
                obscureText: true,
                cursorColor: greenColor,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  selectedColor: greenColor,
                  inactiveColor: greyColor,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                length: 6,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                  if (widget.currentPage == 'register') {
                    UserModel? userModel = await authServices.signup(
                        widget.fullName,
                        widget.email,
                        widget.phone,
                        widget.password,
                        pinController.text);
                    if (userModel == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Maaf, akun tersebut sudah terdaftar !',
                          style: mediumFontStyle.copyWith(
                              color: blackColor.withOpacity(0.8)),
                        ),
                        backgroundColor: Colors.amber[400],
                      ));
                    } else {
                      successShowDialog(
                          "Registrasi Berhasil !",
                          "Semangat membantu mengembangkan hasil panen petani dan peternak Indonesia",
                          widget.currentPage.toString());
                    }
                  } else {
                    UserModel? userModel = await authServices.signin(
                        widget.email, widget.password, pinController.text);
                    if (userModel == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Maaf, email atau password tidak sesuai !',
                          style: mediumFontStyle.copyWith(
                              color: blackColor.withOpacity(0.8)),
                        ),
                        backgroundColor: Colors.amber[400],
                      ));
                    } else {
                      successShowDialog(
                          "Login Berhasil !",
                          "Semangat membantu mengembangkan hasil panen petani dan peternak Indonesia",
                          widget.currentPage.toString());
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
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  successShowDialog(String title, String subtitle, String currentPage) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(
              subtitle,
              textAlign: TextAlign.justify,
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor)),
                child: const Text(
                  'Oke',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (currentPage == 'detail') {
                    widget.method!();
                    for (var i = 0; i < 3; i++) {
                      Navigator.pop(context);
                    }
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const MainPage()),
                        (route) => false);
                  }
                },
              ),
            ],
          );
        });
  }
}
