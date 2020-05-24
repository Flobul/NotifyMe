# NotifyMe

Envoi une notification depuis le terminal de l'appareil.

```
iPhone:~ root# notifyme 
Usage: notifyme [arguments...]
      -t    Titre           - titre de la notification      (optionel)
                              défaut : "Titre de la notification"
      -m    Message         - message de la notification    (optionel)
                              défaut : "Voici le message." 
      -d:   bouton par défaut
      -a:   bouton alternatif
      -o:   autre buton
      -q:   interval en secondes
      -p:   champ texte
      -v:   message du champ texte
      -h:   affiche l'aide

  Voici les valeurs de retour en fonction du bouton choisi :
     0 : bouton par défaut
     1 : bouton alternatif
     2 : autre bouton
     3 : interval
iPhone:~ root# notifyme -t Titre -m Message -a Bouton
```

# Paramètres :

- -t => `Titre de la notification`
- -m => `Message de la notification`
- -d/-a/-o => `Ajout d'un bouton, la valeur de sortie diffère en fonction du bouton`
- -q => `Temps pendant lequel la notification reste affichée`
- -p => `Ouvre un champ pour saisir du texte`
- -v => `saisir la valeur par défaut du champ texte`

