# dotfiles

My messy as hell dotfiles I've slapped together over the years.
Not usually very generic, tailored to my individual machines, so this really shouldn't be open source.
But I like a thing or two about it, so here we are!

Take what you like or throw tomatoes at what you don't.
There's plenty of popcorn to go around.

## Notable things

TODO. Hehe :slightly_smiling_face:

- `dadjoke` in `.zshrc`:
  - Gives you a random dadjoke every time you open a shell
    ```
     ___________________________________________________________________________________
    < A bartender broke up with her boyfriend, but he kept asking her for another shot. >
     -----------------------------------------------------------------------------------
       \
        \
            .--.
           |o_o |
           |:_/ |
          //   \ \
         (|     | )
        /'\_   _/`\
        \___)=(___/
    ```

## Install

To install these, I include a simple `install.sh` script to just symlink them to your home directory:

```bash
./install.sh
```

Other things you need include:

- rbenv
- oh-my-zsh
- node
- npm i -g cowsay

And I warned you that I didn't tailor these dotfiles for anyone but me - so unless you go by `hawkins`, you're gonna have a bad time.
Go make yourself a mimosa and get crackin' on a find-and-replace throughout a few places:

- `gitconfig`: `email = hawkins@users.noreply.github.com`
- `gitconfig`: `name = Josh Hawkins`
- `zsh/aliases`: `tdnotes="vim /Users/hawkins/Documents/notes.txt"`
- `zsh/config`: `PATH=...`
- There might be more but frankly I'll probably be Josh Hawkins for a very very long time so I'm not going to keep this list up to date, so you can just sip on that mimosa and run `grep hawkins -r *`
