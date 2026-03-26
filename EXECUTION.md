# Rapport d’exécution des tests automatisés

## 1. Contexte

- **Application :** OrangeHRM
- **Version :** Dernière version déployée
- **Environnement :** Production
- **Date :** 26/03/2026
- **Outils :** Robot Framework, Selenium (navigateur Chrome)
- **Type de tests :** Tests automatisés de non-régression (TNR)

---

## 2. Objectif

L’objectif est de valider les premiers cas de tests automatisés de l’application, définis selon les priorités issues de l’analyse de risque produit (ARP), afin de sécuriser les fonctionnalités critiques.

---

## 3. Périmètre

- **Inclus :**  
  Tests automatisés (cas positifs et négatifs) des fonctionnalités suivantes :
  - authentification
  - gestion du profil
  - gestion des employés

- **Exclus :**  
  Aucun — l’ensemble des tests automatisés disponibles a été exécuté.

---

## 4. Résumé des résultats

- **Début :** 26/03/2026 12:22:21
- **Fin :** 26/03/2026 12:24:38
- **Durée :** 2 min 16 s

- **Tests exécutés :** 10
- **Tests réussis :** 9
- **Tests échoués :** 1
- **Taux de réussite :** 90 %

---

## 5. Tests échoués

- **Nombre d’anomalies :** 1
- **Localisation :** `TS_GESTION_PROFIL`
- **Cas de test :** Changement de mot de passe
- **Criticité :** Élevée (selon ARP)

**Analyse :**  
L’échec se produit au niveau du keyword _"vérification connexion OK"_.

Voir le rapport de bug associé pour le détail : `report.html`

---

## 6. Conclusion

**Décision : GO**

Bien que l’anomalie concerne une fonctionnalité à criticité élevée, celle-ci nécessite la saisie de l’ancien mot de passe, ce qui indique qu’il s’agit d’une fonctionnalité de modification de profil et non de récupération de mot de passe.

L’application reste donc utilisable en l’état et peut être déployée.  
Toutefois, une correction rapide est recommandée.

## Rapport de bug :

- **ID :** BUG-001
- **Titre :** Impossible de modifier le mot de passe
- **Application :** OrangeHRM
- **Version :** Dernière version déployée
- **Environnement :** Production
- **Navigateur :** Chrome
- **Date :** 26/03/2026
- **Criticité :** Élevée
- **Préconditions :** Utilisateur admin existant

---

### Étapes de reproduction

1. Ouvrir le navigateur Chrome
2. Accéder à l’application OrangeHRM
3. Se connecter avec les identifiants :
   - Identifiant : Admin
   - Mot de passe : admin123
4. Accéder à la page de modification du mot de passe :  
   https://opensource-demo.orangehrmlive.com/web/index.php/pim/updatePassword
5. Saisir :
   - Ancien mot de passe : admin123
   - Nouveau mot de passe : test1234
   - Confirmation : test1234
6. Cliquer sur **Save Change**
7. Se déconnecter via le menu utilisateur
8. Revenir à la page de connexion
9. Tenter de se reconnecter avec :
   - Identifiant : Admin
   - Mot de passe : test1234
10. Cliquer sur **Login**

---

### Résultat attendu

Le mot de passe est modifié avec succès.  
L’utilisateur peut se reconnecter avec le nouveau mot de passe.

---

### Résultat obtenu

La modification du mot de passe affiche un message de succès et la déconnexion fonctionne correctement.  
Cependant, la reconnexion avec le nouveau mot de passe échoue avec le message : "Invalid Credentials"
Cela suggère que le nouveau mot de passe n’a pas été correctement enregistré.

---

### Logs

Voir lien vers le rapport/log Robot Framework : `log.html`
