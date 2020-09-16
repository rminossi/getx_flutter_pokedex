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
          image: AssetImage(ConstsApp.bg_home),
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
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/pb.png"),
                      Text(
                        "Pokedex",
                        style: TextStyle(
                            fontSize: 70,
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
                      return _.postList.length < 1
                          ? LoadingWidget()
                          : AnimationLimiter(
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(16),
                                addAutomaticKeepAlives: true,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: 3,
                                    child: ScaleAnimation(
                                      child: GestureDetector(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: GridPokemonItem(
                                            index: _.postList[index].num,
                                            name: _.postList[index].name,
                                            image: _.getImage(_.postList[index].num,),
                                          ),
                                        ),
                                        onTap: () =>
                                            _.details(_.postList[index]),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: _.postList.length,
                              ),
                            );
                    }),
                  ),
                ),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: navBottom,
      ),
    );
  }
}
