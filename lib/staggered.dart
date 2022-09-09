import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Staggered extends StatefulWidget {
  const Staggered({Key? key}) : super(key: key);

  @override
  State<Staggered> createState() => _StaggeredState();
}

class _StaggeredState extends State<Staggered> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: screenWidth * 0.042,
                height: screenHeight * 0.042,
                child: SvgPicture.asset("assets/images/insta.svg",
                    color: Colors.grey),
              ),
              SizedBox(
                width:screenWidth*0.02,
              ),
              const Text("basic_flutter",style: TextStyle(color: Colors.grey),),
            ],
          ),
          centerTitle: true,
        ),

        body:Padding(
          padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
          child: GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              pattern: const [
                WovenGridTile(1),
                WovenGridTile(
                  5 / 7,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd,
                )

              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: 20,
                  (context, index) => Container(
                       decoration: BoxDecoration(
                           color: index % 2 == 0 ? Colors.red[500] : Colors.grey[700],
                           borderRadius: const BorderRadius.all(Radius.circular(15)),
                       ),
                      child: Center(
                          child: Text(
                            index.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                          ),),
                   ),
              ),
            ),
          ),
        )
    );
  }
}
