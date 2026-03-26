# projet_tutore_LECLERC_FANNY

## Installation

### 1. Cloner le projet

git clone (https://github.com/FannyLec/projet_tutore_LECLERC_FANNY.git)

### 2. Créer un environnement virtuel

python -m venv venv

### 3. Activer l’environnement virtuel

venv\Scripts\activate

### 4. Installer les dépendances

pip install -r requirements.txt

### 5. Configurer les variables d’environnement

- Copier le fichier `.env.example`
- Le renommer en `.env`
- Renseigner les variables nécessaires (utilisateur, mot de passe)

## Lancement des tests

Les tests sont réalisés avec Robot Framework et Selenium, et exécutés sur le navigateur Chrome.

### Commande de lancement

- Tous les tests : robotcode robot tests\
- Cas passants : robotcode robot --include test_positive tests\
- Cas non passants : robotcode robot --include test_negative tests\

## Architecture

Le projet suit une architecture de type **Page Object Model (POM)**, organisée en :

- pages (représentation des écrans)
- keywords / steps (logique métier)
- testsuites (scénarios de test)

### Racine du projet

- `.env` : variables sensibles (compte utilisateur)
- `.env.example` : modèle à compléter après clonage
- `.gitignore` : exclusion du cache Python, du venv et du fichier `.env`
- `robot.toml` : configuration Robot Framework (notamment le dossier de sortie des résultats)
- `requirements.txt` : liste des dépendances à installer

### Dossier `resources`

- **config**
  - `env_vars.py` : chargement des variables depuis le `.env`
  - `Variables.resource` : variables globales (BROWSER, BASE_URL, waits, compte utilisateur…)

- **fixture**
  - `BaseTests.resource` : gestion des suite et test setup/teardown (initialisation, navigation, initialisation du dictionnaire compte utilisateur, fermeture du navigateur)

- **pages**
  - un fichier par page
  - `BasePages.resource` : éléments communs (navigation page, logout, messages…)

- **keywords**
  - un fichier par page, contenant les actions métier

### Dossier `tests`

- un fichier par suite de test, généralement organisé par feature :
  - authentification
  - gestion du profil
  - gestion des employés
