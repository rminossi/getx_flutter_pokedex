
import 'package:get/get.dart';
import 'package:pokedex/app/bindings/details_binding.dart';
import 'package:pokedex/app/ui/android/details/details_page.dart';
import 'package:pokedex/app/ui/android/home/home_page.dart';
part './app_routes.dart';


class AppPages {
  static final pages = [
    //GetPage(name: Routes.SPLASH, page:()=> SplashPage(),),
    GetPage(name: Routes.INITIAL, page:()=> HomePage(),),
    GetPage(name: Routes.DETAILS, page:()=> DetailsPage(), binding: DetailsBinding()),
  ];
}