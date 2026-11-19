import 'package:flutter/material.dart';
import 'connexion.dart';
import 'accueil.dart';
import 'cv.dart';

class MembreFamille {
  final String nom;
  final String lien;
  final String profession;
  final String imagePath;
  final String description;

  const MembreFamille({
    required this.nom,
    required this.lien,
    required this.profession,
    required this.imagePath,
    required this.description,
  });
}

const List<MembreFamille> famille = [
  MembreFamille(
    nom: 'Musambya',
    lien: 'Papa',
    profession: 'Père de famille',
    imagePath: 'assets/images/papa.jpg',
    description: 'Papa, pilier de la famille Musambya.',
  ),
  MembreFamille(
    nom: 'Rachel',
    lien: 'Maman',
    profession: 'Mère de famille',
    imagePath: 'assets/images/maman.jpg',
    description: 'Maman, toujours présente pour la famille.',
  ),
  MembreFamille(
    nom: 'Thierry',
    lien: 'Moi',
    profession: 'Étudiant ISIG-GOMA - Réseaux & Télécom',
    imagePath: 'assets/images/thierry.jpg',
    description: 'MLisho MSambya Thierry, étudiant en Licence 4 à ISIG-GOMA.',
  ),
  MembreFamille(
    nom: 'Tino',
    lien: 'Petite soeur',
    profession: 'Élève',
    imagePath: 'assets/images/tino.jpg',
    description: 'Petite soeur de la famille qui as 5ans.',
  ),
  MembreFamille(
    nom: 'Hosto',
    lien: 'Petit frère',
    profession: 'Élève',
    imagePath: 'assets/images/hosto.jpg',
    description: 'Petit frère de la famille qui as 3ans.',
  ),
];

class FamillePage extends StatelessWidget {
  const FamillePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Famille'),
        backgroundColor: const Color(0xFF0D2B4E),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFE8EEF5),
            child: const Column(
              children: [
                Text('Ma Famille - 5 Personnes', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0D2B4E))),
                SizedBox(height: 4),
                Text('Famille Musambya - Goma, RDC', style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: famille.length,
              itemBuilder: (context, index) {
                final membre = famille[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xFF0D2B4E),
                          // IMAGE CORRIGÉE : Utilisation de AssetImage avec le chemin du membre
                          backgroundImage: AssetImage(membre.imagePath),
                        ),
                        title: Text(membre.nom, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                        subtitle: Text(membre.lien),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xFF0D2B4E), borderRadius: BorderRadius.circular(20)),
                          child: Text(membre.lien, style: const TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [const Icon(Icons.work, size: 16), const SizedBox(width: 6), Text('Profession : ${membre.profession}')]),
                            const SizedBox(height: 6),
                            Text(membre.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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