part of 'menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profil saya",
          style: TextStyle(color: blackColor),
        ),
      ),
      body: ListView(
        children: <Widget>[
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
                  children: const [
                    Text(
                      'Eduardo Hernandez',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Berkeley, California",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
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
                      _settings[index][3]);
                }),
          ),
        ],
      ),
    );
  }

  settingsOption(String title, String subtitle, IconData icon, Color color) {
    return ListTile(
      onTap: () {
        if (title == 'Logout') {
          // showLogoutDealog();
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
}
