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
              Text('Profile Pages'),
              ElevatedButton(
                  onPressed: () {
                    context.read<UserCubit>().signOut();
                    Get.to(SignInPages());
                  },
                  child: Text('LogOut')
              )
            ],
          )
      ),
    );
  }
}
