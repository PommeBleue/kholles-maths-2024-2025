# But du repo
J'ai assuré, durant l'année scolaire 2024/2024, des khôlles de mathématiques en classe de MPI/MPI* au Lycée Paul Valéry. Ce repo est là pour garder une trace des planches d'exercices ainsi que des éventuelles corrections que j'ai la foi de taper pour certains exercices. 

# Utilisation 

Si vous voulez cloner le présent repo pour l'utiliser à votre tour, voici comment je compile mes fichiers `.tex` dossier par dossier : 
```cmd
$ make run nomDuDossier [nomDuFichier]
```
Ne pas spécifier de nom de fichier compilera le fichier `main.tex` du dossier indiqué, si ce fichier existe. Par exemple, pour compiler `public.tex` du dossier `s3`, je tape :
```cmd 
$ make run s3 public
```