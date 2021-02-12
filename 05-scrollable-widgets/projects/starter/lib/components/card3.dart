import 'package:flutter/material.dart';
import '../models/models.dart';
import '../fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card3({Key key, this.recipe}) : super(key: key);

  List<Widget> createTagChips() {
    var chips = List<Widget>();
    recipe.tags.take(6).forEach((element) {
      var chip = Chip(
          label: Text(element, style: FooderlichTheme.darkTextTheme.bodyText1),
          backgroundColor: Colors.black.withOpacity(0.7));
      chips.add(chip);
    });

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(recipe.backgroundImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.book, color: Colors.white, size: 40),
                  SizedBox(height: 8),
                  Text(recipe.title,
                      style: FooderlichTheme.darkTextTheme.headline2),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Center(
              child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  children: createTagChips()),
            ),
          ],
        ),
      ),
    );
  }
}
