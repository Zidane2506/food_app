part of 'pages.dart';

class PaymentPages extends StatefulWidget {
  const PaymentPages({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<PaymentPages> createState() => _PaymentPagesState();
}

class _PaymentPagesState extends State<PaymentPages> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: 'Payment',
      subTitle: 'You deserve better meal',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Item Orders
                  Text(
                    'Item Orders',
                    style: blackFontStyle3.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.transaction.food!.picturePath!),
                            )),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 189,
                              child: Text(
                                widget.transaction.food!.name!,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              )),
                          Text(NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(widget.transaction.food!.price!))
                        ],
                      ),
                      Expanded(
                          child: Text(
                        '${widget.transaction.quantity} item(s)',
                        textAlign: TextAlign.end,
                        style: greyFontStyle.copyWith(fontSize: 13),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 12,
                  ),
                  // Detail Transaction
                  Text(
                    'Detail Transaction',
                    style: blackFontStyle3.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.transaction.food!.name!,
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(NumberFormat.currency(
                              symbol: 'IDR ', locale: 'id_ID', decimalDigits: 0)
                          .format(widget.transaction.food!.price)),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantity',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text('${widget.transaction.quantity.toString()} item(s)'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sub total',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(NumberFormat.currency(
                              symbol: 'IDR ', locale: 'id_ID', decimalDigits: 0)
                          .format(widget.transaction.food!.price! *
                              widget.transaction.quantity!)),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tax 10%',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(NumberFormat.currency(
                              symbol: 'IDR ', locale: 'id_ID', decimalDigits: 0)
                          .format(50000)),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Driver',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(NumberFormat.currency(
                              symbol: 'IDR ', locale: 'id_ID', decimalDigits: 0)
                          .format(50000)),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 12,
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(NumberFormat.currency(
                              symbol: 'IDR ', locale: 'id_ID', decimalDigits: 0)
                          .format(widget.transaction.total!)),
                    ],
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 12,
                  ),
                  Text(
                    'Deliver to :',
                    style: blackFontStyle3,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nama Penerima',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(widget.transaction.user!.name!),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email Penerima',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(widget.transaction.user!.email!),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Phone Number',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(widget.transaction.user!.phoneNumber!),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Adress',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(widget.transaction.user!.address!),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'House Number',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(widget.transaction.user!.houseNumber!),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'City',
                        style: blackFontStyle3,
                      ),
                      Spacer(),
                      Text(widget.transaction.user!.city!),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    margin: EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        var paymentUrl = await context
                            .read<TransactionCubit>()
                            .submitTransaction(widget.transaction.copyWith(
                                dateTime: DateTime.now(),
                                total:
                                    (widget.transaction.total! * 1.1).toInt() +
                                        50000));

                        if (paymentUrl != null) {
                          Get.to(PaymentMethodPages(paymentUrl: paymentUrl));
                        } else {
                          Get.snackbar(
                            "",
                            "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              'Sign In Failed',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            messageText: Text(
                              'Please try again later',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Order Now',
                        style: blackFontStyle3.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
