# dotfiles

My messy as hell dotfiles I've slapped together over the years.
Not usually very generic, tailored to my individual machines, so this really shouldn't be open source.
But I like a thing or two about it, so here we are!

Take what you like or throw tomatoes at what you don't.
There's plenty of popcorn to go around.

## Notable things

TODO. Hehe :slightly_smiling_face:

- Auto update every **7** days
  - Configurable via `$UPDATE_DOTFILES_DAY` - set this to some number in your `zsh/config`

## Install

To install these, I include a simple `install.sh` script to just symlink them to your home directory:

```bash
./install.sh
```

Other things you need include:

- vundle
- rvm
- oh-my-zsh
- node
- rustup
- neovim
- fastfetch

And I warned you that I didn't tailor these dotfiles for anyone but me - so unless you go by `hawkins`, you're gonna have a bad time.
You'll need to do a find and replace for my name to sort that, have fun.

