part of 'pages.dart';

class DetailPages extends StatefulWidget {
  const DetailPages({
    super.key,
    required this.onBackButtonPressed,
    this.transaction,
  });

  final Function onBackButtonPressed;
  final Transaction? transaction;

  @override
  State<DetailPages> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPages> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.transaction?.food?.picturePath ??
                      'https://ui-avatars.com/api/?name=${widget.transaction?.food?.name}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.onBackButtonPressed != null) {
                          widget.onBackButtonPressed();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          'assets/back_arrow_white.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 180),
                  padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.transaction?.food?.name}',
                                  style: blackFontStyle,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                RatingStars(
                                  rate: widget.transaction?.food?.rate,
                                ),
                              ],
                            ),
                          ),
                          //food Quantity
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_min.png'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: blackFontStyle3.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(999, quantity + 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_add.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        //food description
                        child: Text(
                          widget.transaction?.food!.description ?? '',
                          style: blackFontStyle3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                        // Ingridients
                      Row(
                        children: [
                          Text('Ingredients ',style: blackFontStyle3,),
                          Icon(Icons.info,color: mainColor,size: 20),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 0, 16),
                        //food Ingredient
                        child: Text(
                          widget.transaction?.food?.ingredients ?? '',
                          style: blackFontStyle3,
                        ),
                      ),
                      // Price
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Total Price ', style: blackFontStyle3,),
                                Icon(Icons.monetization_on,color: mainColor, size: 20,),
                              ],
                            ),
                            Text(NumberFormat.currency(
                                symbol: 'IDR ',
                                decimalDigits: 0,
                                locale: 'id_ID').format(
                                quantity * (widget.transaction?.food?.price?.toInt() ?? 0),
                            ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    //   Bottom Order
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                          ),
                          onPressed: (){
                            Get.to(PaymentPages(
                                transaction: widget.transaction!.copyWith(
                                  quantity: quantity,
                                  total: quantity * (widget.transaction?.food?.price?.toInt() ?? 0),
                                )
                            )
                            );
                          },
                          child: Text('Order Now',style: blackFontStyle3.copyWith(color: Colors.white,fontWeight: FontWeight.w600),),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
