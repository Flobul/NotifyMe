# NotifyMe

Envoi une notification depuis le terminal de l'appareil.

```
iPhone:~ root# notifyme 
Usage: Notifyme [arguments...]
  -t: title/header text
  -m: message text
  -d: default button text
  -a: alternate button text
  -o: other button text
  -q: timeout in seconds
  -p: prompt for text input
  -v: default value for text input
  -h: This help message

  It will exit with a status code of the result:
     0: Default Button
     1: Alternate Button
     2: Other Button
     3: Timeout
iPhone:~ root# notifyme -t Titre -m Message -a Bouton
```

# Paramètres :

- -t => `Titre de la notification`
- -m => `Message de la notification`
- -d/-a/-o => `Ajout d'un bouton, la valeur de sortie diffère en fonction du bouton`
- -q => `Temps pendant lequel la notification reste affichée`
- -p => `Ouvre un champ pour saisir du texte`
- -v => `saisir la valeur par défaut du champ texte`

