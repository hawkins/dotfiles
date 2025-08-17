# dotfiles

My messy as hell dotfiles I've slapped together over the years.
Originally for i3 on (Ubuntu?), slowly transitioned to Hyprland on Arch.
Hyprland is largely stolen from [JaKooLit's](https://github.com/JaKooLit/Arch-Hyprland). Their project is *way* more complete than mine - I simply used it as a starting point then tweaked some settings in theming and brought it into my dotfiles here.

Not usually very generic, tailored to my individual machines, so this really shouldn't be open source.
Use JaKooLit's if you want similar, you can check my settings later if you want.

Take what you like or don't what you don't.

## Notable things

TODO. Hehe :slightly_smiling_face:

- Auto update every **7** days
  - Configurable via `$UPDATE_DOTFILES_DAY` - set this to some number in your `zsh/config`
- Simple linking with `stow`

## Install

To install these, I include a simple `install.sh` script to just symlink them to your home directory:

```bash
./install.sh
```

Other things you need include:

- `chezmoi`
- `zsh` with `oh-my-zsh`
- Vundle (if using vim)
- `rvm`
- `node`
- `rustup`
- `neovim`
- `fastfetch`

And I warned you that I didn't tailor these dotfiles for anyone but me - so unless you go by `hawkins`, you're gonna have a bad time.
You'll need to do a find and replace for my name to sort that, have fun.

