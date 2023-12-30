import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User? _user;
  late TextEditingController _anniversaireController;
  late TextEditingController _adresseController;
  late TextEditingController _codePostalController;
  late TextEditingController _villeController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _anniversaireController = TextEditingController();
    _adresseController = TextEditingController();
    _codePostalController = TextEditingController();
    _villeController = TextEditingController();
    _emailController = TextEditingController();
    _fetchUserData();
  }

  void _fetchUserData() async {
    _user = FirebaseAuth.instance.currentUser;

    if (_user != null) {
      String userId = _user!.uid;

      try {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection("users").doc(userId).get();

        if (documentSnapshot.exists) {
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
          setState(() {
            _anniversaireController.text = data['anniversaire'] ?? '';
            _adresseController.text = data['adresse'] ?? '';
            _codePostalController.text = data['codePostal'] ?? '';
            _villeController.text = data['ville'] ?? '';
            _emailController.text = _user!.email ?? '';
          });
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  Widget _buildDataInput(IconData icon, String label, TextEditingController controller, String placeholder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: const Color.fromARGB(255, 33, 33, 33),
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(icon, color: const Color.fromARGB(255, 33, 33, 33)),
              ),
              style: TextStyle(color: const Color.fromARGB(255, 33, 33, 33)),
            ),
          ),
        ],
      ),
    );
  }

  void _updateUserData() async {
    if (_user != null) {
      String userId = _user!.uid;

      try {
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'anniversaire': _anniversaireController.text,
          'adresse': _adresseController.text,
          'codePostal': _codePostalController.text,
          'ville': _villeController.text,
          'email': _user!.email,
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User data updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update user data')),
        );
        print('Error updating user data: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Mon Profil', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              // Navigate to Home
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDataInput(Icons.email, 'Email', _emailController, 'Enter your email'),
            _buildDataInput(Icons.cake_rounded, 'Anniversaire', _anniversaireController, 'Enter your birthday'),
            _buildDataInput(Icons.house, 'Adresse', _adresseController, 'Enter your address'),
            _buildDataInput(Icons.local_post_office, 'Code postal', _codePostalController, 'Enter your postal code'),
            _buildDataInput(Icons.location_city, 'Ville', _villeController, 'Enter your city'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateUserData,
              child: Text('Save Changes'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 76, 71, 77),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
