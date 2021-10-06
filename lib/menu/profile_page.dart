part of 'menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  final List<List> _settings = [
    [
      'Informasi Akun',
      'Informasi lengkap akun anda',
      Icons.data_usage,
      Colors.orange[400]
    ],
    ['Bantuan', 'Bantuan dan masukan', Icons.help_outline, Colors.blue[400]],
    ['Logout', 'Keluar dari aplikasi', Icons.exit_to_app, Colors.black],
  ];

  Future removePreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(PrefProfile.idUSer);
    sharedPreferences.remove(PrefProfile.name);
    sharedPreferences.remove(PrefProfile.email);
    sharedPreferences.remove(PrefProfile.phone);
    sharedPreferences.remove(PrefProfile.pin);
    sharedPreferences.remove(PrefProfile.createdAt);
    sharedPreferences.remove(PrefProfile.login);
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
                "Profil saya",
                style: TextStyle(color: blackColor),
              )
            : const SizedBox(),
      ),
      body: (login == true)
          ? ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (_, i) {
                final x = listUser[i];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          // CircleAvatar(
                          //   radius: 50,
                          //   backgroundColor: Colors.grey[200],
                          //   backgroundImage: const NetworkImage(
                          //       'https://randomuser.me/api/portraits/women/11.jpg'),
                          // ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${x.fullName}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${x.email}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _settings.length,
                          itemBuilder: (context, index) {
                            return settingsOption(
                                _settings[index][0],
                                _settings[index][1],
                                _settings[index][2],
                                _settings[index][3],
                                x);
                          }),
                    )
                  ],
                );
              },
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
                                        selectedIndex: 2,
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

  settingsOption(String title, String subtitle, IconData icon, Color color,
      UserModel userModel) {
    return ListTile(
      onTap: () {
        if (title == 'Logout') {
          showLogoutDealog();
        } else if (title == 'Informasi Akun') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailAccount(
                        userModel: userModel,
                      )));
        }
      },
      subtitle: Text(subtitle),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: boldFontStyle.copyWith(fontSize: 16),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey.shade400,
      ),
    );
  }

  showLogoutDealog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor)),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child:
                    const Text('Logout', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  removePreference();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainPage()),
                      (route) => false);
                },
              ),
            ],
          );
        });
  }
}
