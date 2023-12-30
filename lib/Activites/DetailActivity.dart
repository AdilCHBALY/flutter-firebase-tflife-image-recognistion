import 'package:flutter/material.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> activityDetails;

  ActivityDetailsScreen(this.activityDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Details'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              activityDetails['titre'],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 147, 11, 11),
                fontFamily: 'Poppins', // Remplacez 'Roboto' par le nom de la police souhaitée
                ),
              ),

            SizedBox(height: 20),
            _buildDetailCard(Icons.location_on, 'Location', activityDetails['lieu']),
            _buildDetailCard(Icons.attach_money, 'Price', '\$${activityDetails['prix']}'),
            _buildDetailCard(Icons.group, 'Minimum Number', '${activityDetails['nombreMinimum']}'),
            _buildDetailCard(Icons.category, 'Category', activityDetails['categorie']),
            _buildDetailCard(Icons.date_range, 'Creation Date', activityDetails['createAt'].toDate().toString()),
            SizedBox(height: 20),
            // Afficher l'image de l'activité
            if (activityDetails['image'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  activityDetails['image'],
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )
            else
              Container(), // Placeholder si aucune image disponible
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.black87,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
