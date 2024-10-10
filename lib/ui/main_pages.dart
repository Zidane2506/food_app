part of 'pages.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key, this.initialPages = 0});

  final int initialPages;

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int selectedPage = 0;

  @override
  void iniState() {
    super.initState();
    selectedPage = widget.initialPages;
    PageController pageController =
        PageController(initialPage: widget.initialPages);
  }

  PageController pageController = PageController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            color: 'FAFAFC'.toColor(),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPages(),
                ),
                Center(
                  child: OrderHistoryPages(),
                ),
                Center(
                  child: ProfilePages(
                    user: mockUser,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (int index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
