part of 'pages.dart';

class IlustrationPages extends StatelessWidget {
  const IlustrationPages(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.picturePath,
      required this.buttonTitle1,
      this.buttonTitle2,
      required this.buttonTap1,
      this.buttonTap2});

  final String title;
  final String subTitle;
  final String picturePath;

  final String buttonTitle1;
  final String? buttonTitle2;

  final Function buttonTap1;
  final Function? buttonTap2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              picturePath,
              width: 240,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: blackFontStyle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subTitle,
                style: blackFontStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                  ),
                  onPressed: () {
                    buttonTap1();
                  },
                  child: Text(
                    buttonTitle1,
                    style: blackFontStyle.copyWith(
                        color: Colors.white, fontSize: 14),
                  ),
                ),
                (buttonTap2 == null)
                    ? SizedBox()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                        ),
                        onPressed: () {
                          buttonTap2!();
                        },
                        child: Text(buttonTitle2!),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
