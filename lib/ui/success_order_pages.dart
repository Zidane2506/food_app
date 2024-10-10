part of 'pages.dart';

class SuccessOrderPages extends StatelessWidget {
  const SuccessOrderPages({super.key});

  @override
  Widget build(BuildContext context) {
    return IlustrationPages(
        title: "Other foods are on the way",
        subTitle: "Just stay at home while we are\npreparing your best food!",
        picturePath: 'assets/bike.png',
        buttonTap1: () {},
        buttonTap2: () {
          Get.offAll(MainPages(initialPages: 1));
        },
        buttonTitle1: 'Order other foods',
        buttonTitle2: 'View my order',
    );
  }
}
