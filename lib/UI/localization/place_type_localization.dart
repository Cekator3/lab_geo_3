import '../../repositories/enums/place_type.dart';

/// Subsystem to translate [PlaceType] values into user-readable strings.
class PlaceTypeLocalization
{
  static final _localizations = {
    PlaceType.branch: 'Компания',
    PlaceType.attraction: 'Достопримечательность',
    PlaceType.building: 'Здание',
    PlaceType.street: 'Улица'
  };

  static String localize(PlaceType type)
  {
    return _localizations[type]!;
  }
}
