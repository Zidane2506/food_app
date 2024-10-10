part of 'pages.dart';

class GeneralPages extends StatelessWidget {
  const GeneralPages({
    super.key,
    this.title = "Title",
    this.subTitle = "Subtitle",
    this.bgColor,
    this.onBackButtonPressed,
    this.child,
  });

  final String title;
  final String subTitle;
  final Color? bgColor;
  final Function? onBackButtonPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: bgColor ?? Colors.white,
          ),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: <Widget>[
                        onBackButtonPressed != null
                            ? GestureDetector(
                                onTap: () {
                                  if (onBackButtonPressed != null) {
                                    onBackButtonPressed!();
                                  }
                                  ;
                                },
                                child: Container(
                                  width: defaultMargin,
                                  height: defaultMargin,
                                  margin: EdgeInsets.only(right: 26),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/back_arrow.png')),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              title,
                              style: blackFontStyle,),
                            Text(
                              subTitle,
                              style: blackFontStyle2,),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: defaultMargin,
                width: double.infinity,
                color: 'FAFAFC'.toColor(),
              ),
              child ?? SizedBox(),
            ],
          )),
        ],
      ),
    );
  }
}
