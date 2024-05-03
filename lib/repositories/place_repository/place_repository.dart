import 'DTO/place.dart';
import 'DTO/place_list_item.dart';
import 'errors/find_place_errors.dart';
import 'errors/get_place_errors.dart';
import 'view_models/find_place_view_model.dart';

/// A subsystem for interacting with stored data on geographic places.
class PlaceRepository
{
  /// Retrieves information about geographic place.
  ///
  /// Returns `null` if error occurred or geographic place not exists.
  Future<Place?> get(String id, GetPlaceErrors errors) async
  {
    // ...
  }

  /// Retrieves a list of relevant geographic places
  ///
  /// Returns an empty list if error occurred.
  Future<List<PlaceListItem>> find(FindPlaceViewModel search, FindPlaceErrors errors) async
  {
    // ...
  }
}
