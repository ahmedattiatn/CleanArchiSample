## ✨ Des remarques générales

1. **@StateObject** : Utilise @StateObject au lieu de @ObservedObject, sinon le HomeViewModel est recréé à chaque rechargement de la vue.
   Résultat : l'appel loadLeagues() peut être déclenché plusieurs fois.
   
   @ObservedObject doit être utilisé uniquement pour les vues enfants qui reçoivent un ViewModel depuis leur parent.

2. **KEY** : Mettre la clé dans `User Defined` ou, de préférence, sur le serveur, puis la récupérer et la déchiffrer avec la clé privée.

3. **BaseURL** : Mettre la base URL dans `User Defined` et récupérer la bonne URL selon la Target (Release, Debug, ...).

4. **ERROR** : Gérer les erreurs réseau en utilisant un `Enum` avec plusieurs cas et définir un localizedDescription personnalisé pour chacun afin de mettre à jour l’UI.

5. **Navigation** : Depuis iOS 16, il est recommandé d’utiliser NavigationStack à la place de NavigationView. Pour un système de navigation complexe, il est préférable de passer par un Coordinator avec des enums . Voici une bonne vidéo que j’ai utilisée pour implémenter le Coordinator : https://www.youtube.com/watch?v=aaLRST7tHFQ


6. **l’architecture du projet**  : Clean Architecture avec séparation des couches 
Data Layer :

Responsable de récupérer les données (réseau, base locale, etc.) et de gérer les erreurs.

Elle ne fait que fournir les données ou les erreurs mappées correctement.

Domain Layer :

Contient les Use Cases qui appliquent les règles métiers.

Elle transforme les données de la couche Data en informations prêtes à être utilisées par la couche présentation.

Presentation Layer :

Contient les ViewModels qui récupèrent les Use Cases de la couche Domain.

Les ViewModels exposent des données observables pour mettre à jour la UI.

Résumé :

La couche Data récupère les données.

La couche Domain applique les règles métiers via les Use Cases.

La couche Presentation (UI) récupère ces données via le ViewModel pour afficher la vue.

On peut également créer un modèle de données propre à chaque couche. Ainsi, si les modèles côté Domain changent, la couche Presentation n’a pas besoin de beaucoup de modifications, ce qui améliore la maintenabilité.

Cette structure permet de rendre le projet plus testable, maintenable et scalable.


7. **DI** : Utiliser un système d’injection de dépendance. Dans l’exemple, j’ai utilisé une Factory, mais on peut aussi rester avec l’injection classique via les init. Cela permet de mieux gérer les dépendances et d’éviter les fuites mémoire.

8. **DS** : Utilisez un design system dans le projet avec une structuration classique : atomes, molécules, tokens, organisation. Cela permet de réutiliser facilement les composants et d’harmoniser l’UI dans tout le pro$jet.

9. **UI** : Utilisez des petites fonctions @ViewBuilder pour créer des mini-vues, ou mieux, des structures réutilisables. Cela évite de recharger toute la vue à chaque changement d’état et permet de garder le code simple.

10. **TESTS** : Pour les tests unitaires, on peut utiliser XCTest ou SwiftTesting classique pour couvrir différents cas.
   On peut également utiliser une librairie comme Snapshot Testing pour lier les previews et générer des captures d’écran automatiquement.

