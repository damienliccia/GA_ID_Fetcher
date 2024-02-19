## Un script Bash pour récupérer des identifiants Google Analytics et des informations sur le nom de domaine 

Un **script Bash** relativement simple qui utilise **curl** pour extraire les identifiants Google Analytics pouvant être présents sur des sites internet. L'herbergeur utilisé par le site est également récupéré via **whois**.

Les sites à tester doivent être ajoutés dans le fichier *urls_to_check.txt*.

Note : pour éviter les duplicates à chaque lancement du script, le fichier de résultat *output.csv* est supprimé. 

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



https://github.com/damienliccia/GA_ID_Fetcher/assets/24547427/470889b1-9d0c-493d-8978-73ad5e97cfff



