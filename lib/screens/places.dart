import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  void _openAddNewPlacePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const AddPlaceScreen()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () => _openAddNewPlacePage(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(places: userPlaces),
    );
  }
}
