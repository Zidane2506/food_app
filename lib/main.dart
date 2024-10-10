import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/ui/pages.dart';
import 'package:get/get.dart';

import 'cubit/food_cubit.dart';
import 'cubit/transaction_cubit.dart';
import 'cubit/user_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => FoodCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: SignInPages(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
