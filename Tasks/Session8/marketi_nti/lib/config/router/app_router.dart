import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketi_nti/auth/sign_in_view.dart';
import 'package:marketi_nti/config/router/router_transitions.dart';
import 'package:marketi_nti/config/router/routes.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/home/home_view.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return RouterTransitions.build(
          BlocProvider(
            create: (context) => SignInCubit(apiConsumer: ApiConsumer()),
            child: SignInView(),
          ),
        );
      case Routes.home:
        return RouterTransitions.buildHorizontal(HomeView());
      default:
        return RouterTransitions.build(
          Scaffold(body: Center(child: Text("No Route"))),
        );
    }
  }
}
