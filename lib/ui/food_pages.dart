part of 'pages.dart';

class FoodPages extends StatefulWidget {
  const FoodPages({super.key});

  @override
  State<FoodPages> createState() => _FoodPagesState();
}

class _FoodPagesState extends State<FoodPages> {
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<FoodCubit>().getFoods();
    super.initState();
  }

  void onRefresh() {
    context.read<FoodCubit>().getFoods();
  }
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 1 * defaultMargin;

    return ListView(
      children: [
        //   Header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Food Market',
                    style: blackFontStyle,
                  ),
                  Text(
                    "Let's get some foods!",
                    style: blackFontStyle2,
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath ??
                          '',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        //   Card Food
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          child: BlocBuilder<FoodCubit, FoodState>(
              builder: (_, state) => (state is FoodLoaded)
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.foods
                          .map(
                            (food) => Padding(
                              padding: EdgeInsets.only(
                                  left: (food == state.foods.first)
                                      ? defaultMargin
                                      : 0,
                                  right: defaultMargin),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(DetailPages(
                                      onBackButtonPressed: () {
                                        Get.back();
                                      },
                                      transaction: Transaction(
                                          food: food,
                                          user: (context.read<UserCubit>().state
                                                  as UserLoaded)
                                              .user),
                                    )
                                    )!.then((value){
                                      //method refresh
                                    });
                                  },
                                  child: FoodCard(
                                    food: food,
                                  )),
                            ),
                          )
                          .toList())
                  : Center()),
        ),
        //   Tab Layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabbar(
                selectedIndex: selectedIndex,
                titles: ['New Taste', 'Popular', 'Recommended'],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                if (state is FoodLoaded) {
                  List<Food> foods = state.foods
                      .where((e) => e.types!.contains((selectedIndex == 0)
                          ? FoodType.new_food
                          : (selectedIndex == 1)
                              ? FoodType.popular
                              : FoodType.recommended))
                      .toList();
                  return Column(
                    children: foods
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(DetailPages(
                                  onBackButtonPressed: () {
                                    Get.back();
                                  },
                                  transaction: Transaction(
                                      food: e,
                                      user: (context.read<UserCubit>().state
                                      as UserLoaded)
                                          .user),
                                )
                                );
                              },
                              child: FoodListItem(
                                food: e,
                                itemWidth: listItemWidth,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(
                    child: loadingIndicator,
                  );
                }
              }),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ],
    );
  }
}
