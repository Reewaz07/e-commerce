import 'package:ecommerce_app/auth/pages/login_page.dart';
import 'package:ecommerce_app/auth/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouter = GoRouter(routes: $appRoutes, initialLocation: '/login');

final routerProvider = Provider<GoRouter>((ref) {
  return appRouter;
});

// context.go('/login')
// ()=> context.go(LoginRoute())

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage();
  }
}

@TypedGoRoute<SignupRoute>(path: '/signup')
class SignupRoute extends GoRouteData with $SignupRoute {
  const SignupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignUpPage();
  }
}
