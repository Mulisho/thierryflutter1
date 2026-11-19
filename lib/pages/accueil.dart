import 'package:flutter/material.dart';
import 'connexion.dart';
import 'cv.dart';
import 'famille.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  void _allerVers(BuildContext context, int index) {
    Widget page;
    if (index == 0) {
      page = const ConnexionPage();
    } else if (index == 1) {
      page = const AccueilPage();
    } else if (index == 2) {
      page = const CvPage();
    } else {
      page = const FamillePage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil - Thierry MLisho'),
        backgroundColor: const Color(0xFF0D2B4E),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF0D2B4E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // IMAGE CORRIGÉE
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage('assets/images/thierry.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'MLISHO MSAMBYA THIERRY',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Bienvenue dans mon application CV',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bonjour !',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Je suis Thierry, étudiant en Licence 4 à ISIG-GOMA en Systèmes Informatiques, Réseaux et Télécommunications. Passionné par la technologie, le sport et le travail manuel. Créateur d\'applications web personnalisées et champion universitaire de football.',
              style: TextStyle(height: 1.5, fontSize: 15),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Color(0xFF0D2B4E)),
                title: const Text('Téléphone'),
                subtitle: const Text('+243 815 988 527'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF0D2B4E)),
                title: const Text('Email'),
                subtitle: const Text('mlishomsambyathierry@gmail.com'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Color(0xFF0D2B4E)),
                title: const Text('Adresse'),
                subtitle: const Text('Goma, RDC'),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CvPage()));
                },
                icon: const Icon(Icons.person),
                label: const Text('Voir mon CV complet'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D2B4E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FamillePage()));
                },
                icon: const Icon(Icons.family_restroom),
                label: const Text('Voir ma Famille'),
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF0D2B4E),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => _allerVers(context, i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Connexion'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mon CV'),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'Famille'),
        ],
      ),
    );
  }
}