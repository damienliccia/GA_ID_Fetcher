## Un script qui utilise bash pour récupérer des identifiants Google Analytics

Un script Bash relativement simple qui utilise curl pour extraire les identifiants Google Analytics pouvant être présents sur des sites internet.

Les sites à tester doivent être ajoutés dans le fichier *urls_to_check.txt*.

Note : pour éviter les duplicates à chaque itération du script, le fichier de résultat *output.txt* est supprimé à chaque lancement du script. 

Pour utiliser ce projet : 

```bash
# Pour télécharger le projet depuis Github 
git clone https://github.com/damienliccia/GA_ID_Fetcher
cd GA_ID_Fetcher/

# Pour exécuter le script 
bash getGA.sh 

# Pour récupérer les résultats 
cat output.txt 

```
