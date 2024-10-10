part of 'pages.dart';

class PaymentMethodPages extends StatelessWidget {
  const PaymentMethodPages({super.key, required this.paymentUrl});

  final String paymentUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IlustrationPages(
        title: "Finish your payment",
        subTitle: "Please select your favorite\npayment method",
        picturePath: 'assets/Payment.png',
        buttonTitle1: "Payment Method",
        buttonTap1: () async {
          await launch(paymentUrl);
        },
        buttonTitle2: "Continue",
        buttonTap2: () {
          Get.to(SuccessOrderPages());
        },
      ),
    );
  }
}
