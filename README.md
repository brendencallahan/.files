# My Configs

There are three directories. laptop, desktop, and shared.
Hopefully the names make sense :p

The difference between laptop/desktop is my window manager and zshrc configs.
This is because I have aliases tied to specific directories (like my projects) and they differ between computers.
I also set a resolution/refresh rate with desktop/bspwm.
Delete that at the bottom of desktop/bspwm/.bspwmrc if you want to use it.


## Neovim
Be sure to look at ~/.config/nvim/lua/brenden/maps.lua for *some* of the keybindings.
One useful one is `<leader>fe` for opening nvim-tree.

For neovim, I recommend making a copy of your current config first with

```bash
cp -r ~/.config/nvim ~/.config/nvim-backup
rm -rf ~/.config/nvim
```

Then clone this repo, cd into it then (or just clone the nvim folder)

```bash
cp -r shared/nvim ~/.config/nvim
```

Next, install packer with

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then once packer is installed open the plugins.lua file with

```bash
nvim ~/.config/nvim/lua/brenden/plugins.lua
```

(You will get errors about missing plugins. Just press enter to ignore them, as we will install them next)

Switch to `COMMAND` mode and type the following command

```
:PackerInstall
```

This is not needed now, but in the future to update plugins

```
:PackerSync
```

I make use of prettier_d and eslint_d.
To install/update language servers and parsers (including prettier_d and eslint_d).

```
:Mason
```

## ZSH
For information on installing the powerlevel10k zsh theme visit:
https://github.com/romkatv/powerlevel10k


## OTHER
*p.s. I use archcraft instead of regular arch.*

For fallout terminal grub background (if using same distro)

```bash
cp background.png /boot/grub/themes/archcraft/
```

BSPWM is just copy/paste if you want my setup.

Recommended apps. Hopefully they're all in your package manager :)

```bash
neovim kitty zsh lazygit postman firefox discord spotify moonlight
```

### (copy at your own peril)
