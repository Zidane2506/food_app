part of 'pages.dart';

class SuccessSignUpPages extends StatelessWidget {
  const SuccessSignUpPages({super.key});

  @override
  Widget build(BuildContext context) {
    return IlustrationPages(
        title: "Completed!",
        subTitle:  'Now you are able to order\nsome foods as a self-reward',
        picturePath: 'assets/food_wishes.png',
        buttonTitle1: 'Find your food',
        buttonTap1: () {});
  }
}
