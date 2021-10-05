part of 'menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProgramModel> programs = [];
  String id = '';

  final ProgramServices _programServices = ProgramServices();
  getPrograms() async {
    programs = await _programServices.getAllProgram();
    setState(() {});
  }

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(PrefProfile.idUSer).toString();

    setState(() {});
    getPrograms();
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    Widget newInvestWidget() => Row(
          children: [
            Text(
              'Pendanaan Terbaru',
              style: boldFontStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 35,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  "NEW",
                  style: mediumFontStyle.copyWith(
                      fontSize: 11, color: Colors.white),
                ),
              ),
            ),
          ],
        );

    Widget itemNewInvestment() {
      var programsNew =
          programs.where((element) => element.status == "0").toList();
      return AspectRatio(
        aspectRatio: 3.72 / 3,
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: programsNew.length,
            itemBuilder: (_, i) {
              final x = programsNew[i];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailPage(
                                programModel: x,
                                id: id,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: (i == programsNew.length - 1) ? 0 : 16),
                  child: ItemNewProgram(programModel: x),
                ),
              );
            }),
      );
    }

    Widget headerHome() => Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Hallo, Selamat Datang',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Ayo Bantu Petani Kita !',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              newInvestWidget(),
              const SizedBox(
                height: 20,
              ),
              itemNewInvestment(),
            ],
          ),
        );

    Widget itemCurrentProgram() {
      var programsCurrent =
          programs.where((element) => element.status == "1").toList();
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(defaultMargin),
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pendanaan Berjalan',
              style: boldFontStyle.copyWith(fontSize: 18),
            ),
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: programsCurrent.length,
                  itemBuilder: (_, i) {
                    final x = programsCurrent[i];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailPage(
                                      programModel: x,
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: (i == programsCurrent.length - 1) ? 0 : 16),
                        child: ItemProgramRun(
                          programModel: x,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          headerHome(),
          itemCurrentProgram(),
        ],
      )),
    );
  }
}
