# projet_tutore_LECLERC_FANNY

Installation :
requirements.txt à l'init du rpojet pour l'installation des dépendances

.env.example à copier et enlever example et remplacer user + mdp

robot.toml pour la base URL et output des log de robot framework

git ignore contenant le venv, .env, le dossier output et le cache

Architecture :
dans resources : env_vars.py pour hcarger mes variables secrètes du .env
POM : pages object ; steps ; tests

### 1. Activer l'environnement virtuel

Windows : venv\Scripts\activate

### 2. Lancer les tests

robotcode robot tests\
