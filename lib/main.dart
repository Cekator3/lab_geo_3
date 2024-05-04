// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_geo_3/repositories/enums/place_type.dart';
import 'package:lab_geo_3/repositories/favorite_place_repository/errors/get_all_favorite_places_errors.dart';
import 'package:lab_geo_3/repositories/favorite_place_repository/favorite_place_repository.dart';
import 'package:lab_geo_3/repositories/place_repository/DTO/place_list_item.dart';
import 'package:lab_geo_3/repositories/place_repository/errors/find_place_errors.dart';
import 'package:lab_geo_3/repositories/place_repository/place_repository.dart';
import 'package:lab_geo_3/repositories/place_repository/view_models/find_place_view_model.dart';

class FoodApp extends StatefulWidget
{
  const FoodApp({super.key});

  @override
  FoodAppState createState() => FoodAppState();
}

class FoodAppState extends State<FoodApp>
{
  int currentIndex = 0;

  @override
  Widget build(BuildContext context)
  {
    void onNavigationBarLinkTapped(int index) async
    {
      setState(() {
        currentIndex = index;
      });
    }

    return MaterialApp(
        title: 'Еда',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.light(
                onSurface: Colors.white,
                onBackground: Colors.cyan,
            ),
            textTheme: GoogleFonts.manropeTextTheme(
              const TextTheme(
                bodyMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                bodySmall: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                bodyLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                )
              )
            ),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.cyan,
                titleTextStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                ),
                centerTitle: true,
            ),
        ),
        home: Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: const [
              // FoodsPage(),
              // FavoriteFoodsPage()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onNavigationBarLinkTapped,
            selectedItemColor: Colors.cyan,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Избранное',
              ),
            ],
          ),
        )
    );
  }
}

void main() async
{
  final places = PlaceRepository();
  final search = FindPlaceViewModel(query: 'Югорский государственный университет', city: 'Ханты-мансийск', placeTypes: [PlaceType.branch]);
  final errors = FindPlaceErrors();
  List<PlaceListItem> findedPlaces = await places.find(search, errors);

  final favoritePlaces = FavoritePlaceRepository();
  await favoritePlaces.init();
  final errors2 = GetAllFavoritePlacesErrors();

  for (PlaceListItem place in findedPlaces)
    favoritePlaces.add(place.getId());

  final lol = await favoritePlaces.getAll(errors2);
  final lol2 = await favoritePlaces.getAll(errors2);

  for (final place in (await favoritePlaces.getAll(errors2)))
  {
    favoritePlaces.remove(place.getId());
  }

  final lol3 = await favoritePlaces.getAll(errors2);

  FoodApp app = const FoodApp();
  runApp(app);
}
