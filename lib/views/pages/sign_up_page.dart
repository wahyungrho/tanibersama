part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget textField() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // fullname field
            Text(
              "Nama Lengkap",
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
                controller: fullNameController,
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
            // email address field
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
              "No Telepon",
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
                controller: phoneController,
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
                if (fullNameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    phoneController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Maaf, mohon lengkapi form registrasi !',
                      style: mediumFontStyle.copyWith(
                          color: blackColor.withOpacity(0.8)),
                    ),
                    backgroundColor: Colors.amber[400],
                  ));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PinAuthPage(
                                currentPage: "register",
                                fullName: fullNameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                              )));
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
                  "Daftar Akun",
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
                  "SIGN UP",
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
                      "Sudah memiliki akun ? ",
                      style: regulerFontStyle.copyWith(color: greenColor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        "Masuk Sekarang",
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
