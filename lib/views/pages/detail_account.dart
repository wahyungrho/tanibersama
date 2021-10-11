part of 'pages.dart';

class DetailAccount extends StatelessWidget {
  final UserModel? userModel;
  const DetailAccount({Key? key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5 - 50,
            decoration: const BoxDecoration(
                color: greenColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage("https://i.pravatar.cc/300"),
                            fit: BoxFit.contain)),
                  ),
                  Text(userModel!.fullName!,
                      style: mediumFontStyle.copyWith(
                          fontSize: 20, color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(userModel!.email!,
                      style: regulerFontStyle.copyWith(
                          fontSize: 16, color: Colors.white))
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "No telepon",
                      style: regulerFontStyle.copyWith(
                          color: greyColor, fontSize: 16),
                    ),
                    Text(
                      userModel!.phone!,
                      style: boldFontStyle.copyWith(
                          color: blackColor, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5, color: greyColor!.withOpacity(0.5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Dana Dikelola",
                            style: regulerFontStyle.copyWith(
                                color: greyColor, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'id_ID',
                                    symbol: 'Rp ')
                                .format(
                                    int.parse("${userModel!.totalPendanaan}")),
                            style: boldFontStyle.copyWith(
                                color: blackColor, fontSize: 18),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.4,
                                color: greyColor!.withOpacity(0.5))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Akumulasi Margin",
                            style: regulerFontStyle.copyWith(
                                color: greyColor, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'id_ID',
                                    symbol: 'Rp ')
                                .format(int.parse("${userModel!.totalMargin}")),
                            style: boldFontStyle.copyWith(
                                color: blackColor, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Text("Terdaftar pada :",
                style: regulerFontStyle.copyWith(color: blackColor)),
            const SizedBox(
              height: 6,
            ),
            Text(userModel!.createdAt!,
                style:
                    mediumFontStyle.copyWith(fontSize: 16, color: blackColor))
          ],
        ),
      ),
    );
  }
}
