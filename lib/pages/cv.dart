import 'package:flutter/material.dart';
import 'connexion.dart';
import 'accueil.dart';
import 'famille.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key});

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  Widget _titreSection(String titre) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          Container(width: 4, height: 22, color: const Color(0xFF0D2B4E)),
          const SizedBox(width: 10),
          Text(titre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0D2B4E))),
        ],
      ),
    );
  }

  Widget _carte(String titre, String contenu, IconData icone) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: const Color(0xFF0D2B4E), child: Icon(icone, color: Colors.white, size: 20)),
        title: Text(titre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(contenu),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon CV'),
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
              decoration: BoxDecoration(color: const Color(0xFF0D2B4E), borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  // IMAGE CORRIGÉE
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/thierry.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text('M\'LISHO M\'SAMBYA THIERRY', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text('Licence 4 - Systèmes Informatiques,\nRéseaux et Télécommunications', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 12),
                  const Wrap(spacing: 8, children: [Chip(label: Text('Goma, RDC')), Chip(label: Text('+243 815 988 527')), Chip(label: Text('ISIG-GOMA'))]),
                ],
              ),
            ),
            _titreSection('Profil'),
            const Text('Étudiant en troisième année de licence à ISIG-GOMA en Systèmes Informatiques, Réseaux et Télécommunications, passionné par la technologie, le sport et le travail manuel. Créateur d\'applications web personnalisées, gestionnaire expérimenté, et champion universitaire de football.', style: TextStyle(height: 1.5)),
            _titreSection('Coordonnées'),
            _carte('Téléphone', '+243 815 988 527', Icons.phone),
            _carte('Email', 'mlishomsambyathierry@gmail.com', Icons.email),
            _carte('Adresse', 'Goma, RDC', Icons.location_on),
            _titreSection('Formation'),
            _carte('Licence 3 - Systèmes Informatiques, Réseaux et Télécommunications', 'ISIG-GOMA, RDC\n2024 - en cours', Icons.school),
            _carte('Formation en Anglais Niveau 1 et 2', 'Centre linguistique ISIG-GOMA\n2022-2023 et 2024-2025', Icons.language),
            _titreSection('Expériences'),
            _carte('Gérant du Restaurant de ISTM-BUKAVU - 2020', 'Supervision des opérations quotidiennes, gestion des équipes et des ressources, relation client et organisation.', Icons.restaurant),
            _carte('Développeur Web Indépendant - 2022 à présent', 'Conception d\'applications web personnalisées, intégration responsive et optimisation utilisateur.', Icons.web),
            _titreSection('Compétences Techniques'),
            const Wrap(spacing: 8, runSpacing: 8, children: [Chip(label: Text('Développement Web')), Chip(label: Text('Maintenance Informatique')), Chip(label: Text('Réseaux')), Chip(label: Text('Bureautique')), Chip(label: Text('Gestion')), Chip(label: Text('Flutter')), Chip(label: Text('Python'))]),
            _titreSection('Langues'),
            _carte('Français', 'Courant', Icons.translate),
            _carte('Swahili', 'Courant', Icons.translate),
            _carte('Anglais', 'Niveau 2', Icons.translate),
            _titreSection('Réalisations'),
            _carte('Champion universitaire de football', 'ISIG-GOMA - 2 années consécutives', Icons.sports_soccer),
            _carte('Création d\'applications web', 'Projets personnels et académiques', Icons.code),
            _titreSection('Centres d\'intérêt'),
            const Text('• Technologies de l\'information et réseaux\n• Développement web et design interactif\n• Sport collectif et leadership\n• Apprentissage des langues\n• Travaux pratiques et gestion de projets', style: TextStyle(height: 1.6)),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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