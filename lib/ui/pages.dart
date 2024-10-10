import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app/cubit/cubit.dart';
import 'package:food_app/cubit/food_cubit.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/shared/shared.dart';
import 'package:food_app/ui/widget/widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cubit/user_cubit.dart';

part 'sign_in_pages.dart';
part 'sign_up_pages.dart';
part 'general_pages.dart';
part 'adress_pages.dart';
part 'main_pages.dart';
part 'food_pages.dart';
part 'detail_pages.dart';
part 'payment_pages.dart';
part 'ilustration_pages.dart';
part 'order_history_pages.dart';
part 'success_order_pages.dart';
part 'success_sign_up_pages.dart';
part 'profile_pages.dart';
part 'payment_method_pages.dart';