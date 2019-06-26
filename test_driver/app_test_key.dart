import 'package:flutter_driver/flutter_driver.dart';
import 'package:dicoding_submission/src/common/meals_key.dart';

//home
final homeKey = find.byValueKey(KEY_BOTTOM_NAVIGATION);
//meals dessert
final bottomDessertKey = find.byValueKey(KEY_BOTTOM_ITEM_DESSERT);
final gridDessertKey = find.byValueKey(KEY_GRID_VIEW_DESSERT);
final tapItemDessertKey = find.byValueKey(KEY_TAP_ITEM_DESSERT);
final tapItemFavoriteKey = find.byValueKey(KEY_TAP_ITEM_FAVORITE);
final tapBackButtonKey = find.byValueKey(KEY_TAP_BACK_BUTTON);

//meals seafood
final bottomSeafoodKey = find.byValueKey(KEY_BOTTOM_ITEM_SEAFOOD);
final gridSeafoodKey = find.byValueKey(KEY_GRID_VIEW_SEAFOOD);
final tapItemSeafoodKey = find.byValueKey(KEY_TAP_ITEM_SEAFOOD);

//home favorite
final homeFavoriteKey = find.byValueKey(KEY_BOTTOM_ITEM_FAVORITE);

//meals favorite dessert
final tabItemFavoriteDessertKey = find.byValueKey(KEY_TAB_ITEM_FAVORITE_DESSERT);
final gridFavoriteDessertKey = find.byValueKey(KEY_GRID_VIEW_FAVORITE_DESSERT);
final tapItemFavoriteDessertKey = find.byValueKey(KEY_TAP_ITEM_FAVORITE_DESSERT);

//meals favorite seafood
final tabItemFavoriteSeafoodKey = find.byValueKey(KEY_TAB_ITEM_FAVORITE_SEAFOOD);
final gridFavoriteSeafoodKey = find.byValueKey(KEY_GRID_VIEW_FAVORITE_SEAFOOD);
final tapItemFavoriteSeafoodKey = find.byValueKey(KEY_TAP_ITEM_FAVORITE_SEAFOOD);

//meals search seafood
final tapSearch = find.byValueKey(KEY_TAP_SEARCH);
final enterField = find.byValueKey(KEY_FIELD_SEARCH);
final gridSearch = find.byValueKey(KEY_GRID_VIEW_SEARCH);