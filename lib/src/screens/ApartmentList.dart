import 'package:example/src/model/ApartmentModel.dart';
import 'package:example/src/widgets/ApartmentItem.dart';
import 'package:flutter/material.dart';

import '../services/service.dart';

class ApartmentList extends StatefulWidget {

  const ApartmentList({super.key});

  @override
  State<StatefulWidget> createState() => _ApartmentListViewState();

}

class _ApartmentListViewState extends State<ApartmentList> {
  ScrollController? _scrollNotificationController = ScrollController();
  final _scrollThreshold = 200.0;

  Future<List<ApartmentModel>> loadApartments() {
    return loadApartmentFromJson();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApartmentModel>>(
      future: loadApartments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<ApartmentModel> apartments = snapshot.data!;
          return ListView.builder(
            controller: _scrollNotificationController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: apartments.length,
            itemBuilder: (context, index) {
              return ApartmentItem(item: apartments[index],);
            },
          );
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }

}