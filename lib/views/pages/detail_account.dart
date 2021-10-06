part of 'pages.dart';

class DetailAccount extends StatelessWidget {
  final UserModel? userModel;
  const DetailAccount({Key? key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(userModel!.fullName!),
          Text(userModel!.email!),
          Text(userModel!.phone!)
        ],
      )),
    );
  }
}
