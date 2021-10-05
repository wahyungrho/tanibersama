part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget textField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alamat Email",
              style: mediumFontStyle.copyWith(color: blackColor, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: greenColor.withOpacity(0.5)),
              child: Center(
                  child: TextField(
                controller: emailController,
                cursorColor: greenColor,
                style: regulerFontStyle.copyWith(
                    color: blackColor.withOpacity(0.8)),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              )),
            ),
            const SizedBox(
              height: 16,
            ),
            // password field
            Text(
              "Password",
              style: mediumFontStyle.copyWith(color: blackColor, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: greenColor.withOpacity(0.5)),
              child: Center(
                  child: TextField(
                controller: passwordController,
                cursorColor: greenColor,
                obscureText: true,
                style: regulerFontStyle.copyWith(
                    color: blackColor.withOpacity(0.8)),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                if (emailController.text.isNotEmpty ||
                    passwordController.text.isNotEmpty) {
                  setState(() {});
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PinAuthPage(
                              currentPage: "login",
                              email: emailController.text,
                              password: passwordController.text,
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
                  "Masuk",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

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
                  "SIGN IN",
                  style: mediumFontStyle.copyWith(
                    color: blackColor,
                    fontSize: defaultMargin,
                  ),
                ),
                const Divider(),
                textField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum memiliki akun ? ",
                      style: regulerFontStyle.copyWith(color: greenColor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Text(
                        "Daftar Sekarang",
                        style: mediumFontStyle.copyWith(color: greenColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
