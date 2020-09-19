import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/constants/app_constantts.dart';
import 'package:pokedex/app/controller/home/home_controller.dart';
import 'package:pokedex/app/ui/android/home/widgets/grid_item.dart';
import 'package:pokedex/app/ui/android/widgets/bottom_nav_widget.dart';
import 'package:pokedex/app/ui/android/widgets/loading_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double statusHeight = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ConstsApp.bg_home2),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.transparent,
              child: Column(children: <Widget>[
                Container(height: statusHeight),
                Container(
                  color: (Color.fromRGBO(255, 255, 255, 0.1)),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/pb.png"),
                      Text(
                        "Pokedex",
                        style: TextStyle(
                            fontSize: 30,
                            color: (Color.fromRGBO(255, 255, 255, 0.7))),
                      ),
                      Image.asset("assets/images/pb.png"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: GetX<HomeController>(initState: (state) {
                      Get.find<HomeController>().getAll();
                    }, builder: (_) {
                      return _.pokemonList.length < 1
                          ? LoadingWidget()
                          : AnimationLimiter(
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(16),
                                addAutomaticKeepAlives: true,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      child: GestureDetector(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: GridPokemonItem(
                                            index: _.pokemonList[index].num,
                                            name: _.pokemonList[index].name,
                                            num: _.pokemonList[index].num,
                                            type: _.pokemonList[index].type,
                                          ),
                                        ),
                                        onTap: () =>
                                            _.details(_.pokemonList[index]),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: _.pokemonList.length,
                              ),
                            );
                    }),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
