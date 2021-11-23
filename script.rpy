# The script of the game goes in this file.

# Declare characters used by this game. The color argument colorizes the
# name of the character.

define f = Character("eileen")


# The game starts here.

label start:

    # Show a background. This uses a placeholder by default, but you can
    # add a file (named either "bg room.png" or "bg room.jpg") to the
    # images directory to show it.

    scene fox

    # This shows a character sprite. A placeholder is used, but you can
    # replace it by adding a file named "eileen happy.png" to the images
    # directory.

    show eileen happy

    # These display lines of dialogue.

    f "You've created a new Ren'Py game."

    # f "Once you add a story, pictures, and music, you can release it to the world!"

    # f "Hi"

    # This ends the game.
    menu:
        f  "You've created a new Ren'Py game."
        "true": 
            $ button = True
            jump true
        "false":
            return


label true:
    f "Wow, that was one heck of a Tuesday."
    if button == True:
        jump start


