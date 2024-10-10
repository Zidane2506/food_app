part of 'widget.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems(
      {super.key, required this.transaction, required this.itemWidth});

  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
          height: 80,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(transaction.food?.picturePath ??
                    'https://ui-avatars.com/api/?name=${transaction.food?.name}'),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: itemWidth! - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Text(
                    transaction.quantity.toString() + ' item(s) ~',
                  ),
                  Text(NumberFormat.currency(
                          symbol: 'IDR', decimalDigits: 0, locale: 'id-ID')
                      .format(transaction.total)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Waktu'),
              (transaction.status == TransactionStatus.delivered)
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivered',
                              style: blackFontStyle2.copyWith(color: Colors.green),
                            ),
                            Icon(MdiIcons.checkCircle, color: Colors.green, size: 15,)
                          ],
                        ),
                      ))
                  : (transaction.status == TransactionStatus.canceled)
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              border:
                                  Border.all(color: Colors.redAccent, width: 2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 3),
                            child: Text(
                              'Canceled',
                              style: blackFontStyle2.copyWith(
                                  color: Colors.redAccent),
                            ),
                          ))
                      : (transaction.status == TransactionStatus.pending)
                          ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border:
                      Border.all(color: Colors.orangeAccent, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3),
                    child: Text(
                      'Pending',
                      style: blackFontStyle2.copyWith(
                          color: Colors.orangeAccent),
                    ),
                  ))
                          : Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border:
                      Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3),
                    child: Text(
                      'On Delivery',
                      style: blackFontStyle2.copyWith(
                          color: Colors.blueAccent),
                    ),
                  )),
              Text('Status'),
            ],
          ),
        )
      ],
    );
  }
}
