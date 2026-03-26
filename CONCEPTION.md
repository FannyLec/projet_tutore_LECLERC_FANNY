# 1. Contexte et objectifs

L’application **OrangeHRM** est une application web déjà développée et en production.  
Dans le cadre de son évolution continue, de nouvelles fonctionnalités sont intégrées progressivement selon une organisation agile basée sur des itérations et des sprints.

L’objectif de ce plan de conception de test est de définir comment seront préparés, exécutés et suivis les tests système fonctionnels, qu’ils soient :

- manuels, à l’aide d’un cahier de test au format Excel ;
- automatisés, à l’aide de Robot Framework et Selenium.

Dans le contexte d’OrangeHRM, les tests visent en particulier à sécuriser les processus critiques liés à la gestion des employés, car les données manipulées sont sensibles (données personnelles, données administratives, informations RH, etc.).

## Objectifs de test

- la fiabilité fonctionnelle : l’application doit exécuter correctement les actions attendues ;
- la fiabilité des données : les informations doivent être exactes et cohérentes ;
- la sécurisation fonctionnelle des accès selon les rôles utilisateurs ;
- la non-régression des fonctionnalités existantes.

---

# 2. Périmètre

## 2.1 Éléments testés

Le périmètre couvre les **tests système fonctionnels** de l’application web OrangeHRM.

Les tests portent sur :

- les fonctionnalités accessibles via l’interface web ;
- les parcours utilisateurs métiers ;
- les règles de gestion ;
- les contrôles de saisie ;
- l’affichage et la conservation des données.

Fonctionnalités prioritaires (TNR) :

- connexion ;
- déconnexion ;
- ajout d’employé ;
- suppression d’employé.

## 2.2 Hors périmètre

Sont exclus :

- tests de performance et de charge ;
- tests d’API ;
- tests d’accessibilité ;
- tests de sécurité technique ;
- tests unitaires et d’intégration ;
- compatibilité multi-navigateurs avancée ;
- tests mobiles.

---

# 3. Stratégie de test

## 3.1 Niveau de test

Tests de **niveau système**, réalisés via l’interface utilisateur en conditions proches du réel.

## 3.2 Types de tests

- tests fonctionnels ;
- tests de non-régression (TNR).

## 3.3 Méthodes de test

### Tests manuels

Les tests sont exécutés à partir d’un **cahier de test Excel**, rédigé au fil des sprints.

### Tests automatisés

Les tests sont automatisés avec **Robot Framework** et **Selenium**, principalement pour la TNR.

Un scénario est automatisé s’il est :

- validé manuellement ;
- stable ;
- pertinent pour une exécution répétée.

## 3.4 Priorisation des tests

La priorisation repose sur la criticité métier, la fréquence d’utilisation, le risque de régression et la sensibilité des données.

L’automatisation cible en priorité : connexion, déconnexion, ajout et suppression d’employé.

---

# 4. Conception des tests

Les tests sont conçus à partir du story mapping, des user stories, des exigences métier et des critères d’acceptation.

Chaque test vérifie la conformité fonctionnelle et le comportement attendu.

Cf. cahier de test Excel : `Exigences_US_CT.xlsx`

---

# 5. Critères d’entrée et de sortie (DoR / DoD)

## Socle commun

**Entrée :**

- user stories et critères définis ;
- développement terminé ;
- environnement disponible ;
- données prêtes.

**Sortie :**

- tests exécutés ;
- résultats tracés ;
- anomalies majeures traitées ;
- bilan réalisé.

## Spécificités

**Tests manuels :**  
Rédaction préalable des cas de test et validation des nouvelles fonctionnalités.

**Tests automatisés :**  
Scénarios stables intégrés à la TNR pour exécution répétée.

---

# 6. Environnement de test

Les tests sont réalisés avec **Robot Framework** et **Selenium**, sur **Google Chrome**.

Ils sont exécutés sur un **environnement de test dédié**, avec les données de la base correspondante, sur la **dernière version déployée** de l’application.

Les tests (manuels et automatisés) sont effectués hors production afin de garantir la fiabilité et éviter tout impact métier.
