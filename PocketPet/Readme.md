# Creative Portion

An evolution & leveling up function was added to the app. Everytime a pet reaches max happiness in the bar, the next time the user successfully plays with them they will level up and the bar will reset to 1. 
It will then cost 1 more food amount to be able to play each time (ex. for level 1 it only costs 1 "feed", for level 2 it costs 2 "feed"s and so on)
Once a pet reaches level 10, instead of leveling up, the pet evolves the next time the happiness bar is full!
The evolution will change the image displayed for the pet to a cooler version of the animal. 
The levels are reflected individually for each pet in the top right left of the screen through a UILabel.
This feature helps keep the app interesting for users and gives them an incentive to keep playing for longer. It also gives them more freedom to strategize (if they want to level up all pets at the same time or focus on one at a time).
The app also includes sound cues to keep the user stimulated auditorily as well as visually. Every time a pet is successfully fed, the pet will make a short sound (the dog clip is longer so it might continue to play for a while). Once the player successfully levels up, a congratulatory sound will also play. If a player has the patience to reach an evolution, that will play another unique clip. The audio clips are played using an AVAudioPlayer and AVFoundation.

# Extra Credit

The app has color palettes for both light and dark mode. The light mode uses a pastel theme for the animal backgrounds, black text, light grey play/feed buttons, light grey display view bars, and blue buttons to change pets. Dark mode uses muted and darker versions of the animal background colors, white text, darker grey play/feed button, white display view bars, and brighter blue buttons to change pets.

# Design Choices

Only 1 evolution exists right now, reaching level 10 again just resets back to level 1.


