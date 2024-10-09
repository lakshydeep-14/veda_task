import 'package:veda_task/config/routes/route_model.dart';

class Routes {
  static final splash = RouteModel(path: "/", name: "splash");

  static final intro = RouteModel(path: "/intro", name: "intro");

  static final setupProfile =
      RouteModel(path: "/setupProfile", name: "setupProfile");

  static final signup = RouteModel(path: "/signup", name: "signup");

  static final login = RouteModel(path: "/login", name: "login");

  static final dashboard = RouteModel(path: "/dashboard", name: "dashboard");
  static final myplants = RouteModel(path: "/myplants", name: "myplants");
  static final community = RouteModel(path: "/community", name: "community");
  static final nursery = RouteModel(path: "/nursery", name: "nursery");
  static final addPlant = RouteModel(path: "/addPlant", name: "addPlant");
  static final plantDetailScreen =
      RouteModel(path: "/plantDetailScreen", name: "plantDetailScreen");

  static final undefined = RouteModel(path: "/undefined", name: "undefined");
}
