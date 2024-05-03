import 'package:http/http.dart' as http;
import 'DTO/favorite_place_list_item.dart';
import 'errors/get_all_favorite_places_errors.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// A subsystem for interacting with stored data
/// on user's favorite geographic places.
class FavoritePlaceRepository
{
  /// Adds a place to the user's list of favorite geographic places.
  ///
  /// If place is already in the list, nothing will happen.
  void add(String placeId)
  {
    // ...
  }

  /// Removes a place from the user's list of favorite geographic places.
  ///
  /// If place not in the list, nothing will happen
  void remove(String placeId)
  {
    // ...
  }

  /// Checks if a place is in the user's list of favorite geographic places
  bool has(String placeId)
  {
    // ...
  }

  /// Retrieves a list of user's favorite foods.
  ///
  /// Returns an empty list if error was encountered.
  Future<List<FavoritePlaceListItem>> getAll(GetAllFavoritePlacesErrors errors) async
  {
    // ...
  }
}
