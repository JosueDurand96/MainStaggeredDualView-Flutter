import 'package:flutter/material.dart';
import 'package:staggered_dual_view/Meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainStaggeredDualView(),
    );
  }
}

class MainStaggeredDualView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Comidas',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: StaggeredDualView(
          aspectRatio: 0.7,
          spacing: 20,
          itemBuilder: (context, index) {
            return MealItem(meal: meals[index]);
          },
          itemCount: meals.length,
        ),
      ),
    );
  }
}

class MealItem extends StatelessWidget {
  const MealItem({Key key, this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        mainAxisSize : MainAxisSize.min,
        children: [
          Expanded(
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  meal.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
              child: Column(
            children: [
              Text(
                meal.name,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                meal.weight,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class StaggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;

  const StaggeredDualView(
      {Key key,
      @required this.itemBuilder,
      @required this.itemCount,
      this.spacing = 0.0,
      this.aspectRatio = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemBuilder: itemBuilder);
  }
}
