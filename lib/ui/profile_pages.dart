part of 'pages.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${user.picturePath!}')
                  ),
                ),
              ),
              SizedBox(height: 13,),
              Text('${user.name}',style: blackFontStyle,),
              Text('${user.email}',style: blackFontStyle3,),
            ],
          )
      ),
    );
  }
}
