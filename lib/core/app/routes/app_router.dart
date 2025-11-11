import 'package:auto_route/auto_route.dart';
import 'package:startup_task_app/core/app/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: AddItemRoute.page),
    AutoRoute(page: EditItemRoute.page),
  ];
}
