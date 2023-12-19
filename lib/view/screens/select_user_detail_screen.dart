import 'package:flutter/material.dart';
import 'package:uiapiapp/model/users/users_model.dart';

class SelectedUserDetailScreen extends StatelessWidget {
  const SelectedUserDetailScreen({
    required this.user,
    super.key,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected User Detail Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Personal Information'),
            Text('Id: ${user.id}'),
            Text('Name: ${user.name}'),
            Text('UserName: ${user.username}'),
            Text('Email: ${user.email}'),
            Text('phone: ${user.phone}'),
            Text('website: ${user.website}'),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Address'),
            ),
            Text('Street: ${user.address.street}'),
            Text('suite: ${user.address.suite}'),
            Text('city: ${user.address.city}'),
            Text('zipcode: ${user.address.zipcode}'),
            Text('lat: ${user.address.geo.lat}'),
            Text('lng: ${user.address.geo.lng}'),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Company Details'),
            ),
            Text('name: ${user.company.name}'),
            Text('catchPhrase: ${user.company.catchPhrase}'),
            Text('bs: ${user.company.bs}'),
          ],
        ),
      ),
    );
  }
}
