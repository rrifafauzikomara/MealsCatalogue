import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'app_test_key.dart';

void main() {
  group("Meals Production test", () {

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("show list dessert", () async {
      await driver.waitFor(homeKey);
      await driver.waitFor(bottomDessertKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(gridDessertKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(gridDessertKey, 0, 200, Duration(milliseconds: 500));
      await driver.scroll(gridDessertKey, 0, -600, Duration(milliseconds: 500));
      await driver.scroll(gridDessertKey, 0, 800, Duration(milliseconds: 500));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapItemDessertKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(tapItemFavoriteKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapBackButtonKey);
      await Future.delayed(Duration(seconds: 1));
    });

    test("show list seafood", () async {
      await driver.tap(bottomSeafoodKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(gridSeafoodKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(gridSeafoodKey, 0, 200, Duration(milliseconds: 500));
      await driver.scroll(gridSeafoodKey, 0, -600, Duration(milliseconds: 500));
      await driver.scroll(gridSeafoodKey, 0, 800, Duration(milliseconds: 500));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapItemSeafoodKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(tapItemFavoriteKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapBackButtonKey);
      await Future.delayed(Duration(seconds: 1));
    });

    test("show list favorite dessert", () async {
      await driver.tap(homeFavoriteKey);
      await driver.tap(tabItemFavoriteDessertKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(gridFavoriteDessertKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapItemFavoriteDessertKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(tapItemFavoriteKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapBackButtonKey);
      await Future.delayed(Duration(seconds: 1));
    });

    test("show list favorite seafood", () async {
      await driver.tap(tabItemFavoriteSeafoodKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(gridFavoriteSeafoodKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapItemFavoriteSeafoodKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(tapItemFavoriteKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapBackButtonKey);
      await Future.delayed(Duration(seconds: 1));
    });

    test("search meals seafood", () async {
      await driver.tap(bottomSeafoodKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(gridSeafoodKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapSearch);
      await driver.waitFor(gridSearch);
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(enterField);
      await driver.enterText("Apple");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapBackButtonKey);
      await Future.delayed(Duration(seconds: 1));
    });

  });
}