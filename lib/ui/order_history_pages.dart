part of 'pages.dart';

class OrderHistoryPages extends StatefulWidget {
  const OrderHistoryPages({super.key});

  @override
  State<OrderHistoryPages> createState() => _OrderHistoryPagesState();
}

class _OrderHistoryPagesState extends State<OrderHistoryPages> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (_, state) {
          if (state is TransactionLoaded) {
            if (state.transactions.length == 0) {
              return IlustrationPages(
                  title: 'Buy your food!',
                  subTitle: 'Seem like you are hungry',
                  picturePath: 'assets/food_wishes.png',
                  buttonTitle1: 'Explore food',
                  buttonTap1: () {}
              );
            } else {
              double listItemWidth =
                  MediaQuery.sizeOf(context).width - 2 * defaultMargin;

              return ListView(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 12,
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Orders',
                          style: blackFontStyle2,
                        ),
                        Text(
                          'Wait for the best meal',
                          style: blackFontStyle3.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomTabbar(
                          selectedIndex: selectedIndex,
                          titles: ['In Progress', 'Past Order'],
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Builder(
                            builder: (_) {
                              List<Transaction> transaction = (
                              selectedIndex == 0
                                  ? state.transactions
                                  .where((e) =>
                              e.status == TransactionStatus.on_delivery ||
                                  e.status == TransactionStatus.pending)
                                  .toList()
                                  : mockTransaction
                                  .where((e) =>
                              e.status == TransactionStatus.canceled ||
                                  e.status == TransactionStatus.delivered)
                                  .toList()
                              );
                              return Column(
                                children: transaction
                                    .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OrderListItems(
                                    transaction: e,
                                    itemWidth: listItemWidth,
                                  ),
                                ))
                                    .toList(),
                              );
                            }
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          } else {
            return Center(
              child: loadingIndicator,
            );
          }
        },
      ),
    );
  }
}
