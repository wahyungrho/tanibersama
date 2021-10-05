part of 'menu.dart';

class PorfolioPage extends StatefulWidget {
  const PorfolioPage({Key? key}) : super(key: key);

  @override
  _PorfolioPageState createState() => _PorfolioPageState();
}

class _PorfolioPageState extends State<PorfolioPage> {
  bool? login;
  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    login = sharedPreferences.getBool(PrefProfile.login) ?? false;
    print("Status login $login ");
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
          ? const SizedBox()
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
