import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/string_constants.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key});

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  void initState() {
    logout(context);
    super.initState();
  }

  void logout(BuildContext context) async {
    await GetStorage().erase().then((_) async {
      if (context.mounted) {
        context.go(StringConst.registrationViewRoute);
      }
    }).onError((e, s) {
      logger.e(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const InitialLoader();
  }
}
