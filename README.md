# My Configs

### *copy at your own peril*

![image](https://user-images.githubusercontent.com/47364240/222180285-4303f2ab-37ba-4979-9d3c-f29de163e33b.png)

There are three directories: laptop, desktop, and shared.
Hopefully the names make sense :p

The difference between laptop/desktop is my window manager and zshrc configs.
This is because I have aliases tied to specific directories (like my projects) and they differ between computers.
I also set a resolution/refresh rate with desktop/bspwm.
Delete that at the bottom of desktop/bspwm/.bspwmrc if you want to use it.


## Neovim
#### /shared/nvim
Requirements
```bash
sudo pacman -S neovim ripgrep cmake luarocks tsc nodejs yarn tsc gdb lldb python-pip
tex-live texlive-most biber texlive-latexindent-meta(AUR) zathura zathura-pdf-mupdf
```

(for easy creation of LaTeX figures in inkscape: https://castel.dev/post/lecture-notes-2/)
```bash
pip3 install inkscape-figures
```

(for Python debugging, be sure to use a virtualenv)
```bash
python3 -m venv example
source example/bin/activate
```

Be sure to look at ~/.config/nvim/lua/brenden/maps.lua for *some* of the keybindings.
One useful one is `<leader>fe` for opening nvim-tree.

For neovim, I recommend making a copy of your current config first with
```bash
cp -r ~/.config/nvim ~/.config/nvim-backup
rm -rf ~/.config/nvim
```
Then clone this repo and cd into it with:
```bash
git clone https://github.com/brendencallahan/.files
cd .files
```
(you can also just clone the nvim folder)

After you have cloned the repo copy it anywhere compatible with NeoVim:
```bash
cp -r shared/nvim ~/.config/nvim
```
Start NeoVim. (You may get errors about missing plugins. Just press enter to ignore them, as the next step should fix this.)
```bash
nvim
```
Switch to `COMMAND` mode and type the following command. (You can also use this to update plugins).
```
:PackerSync
```
I make use of prettier_d and eslint_d.

Though it should be automatic, to install/update language servers and parsers
(including prettier_d and eslint_d).
```
:Mason
```
If you would like to change 'brenden' to something else, you need only edit `init.lua` and `lua/brenden`.

## ZSH
For information on installing the powerlevel10k zsh theme visit:
https://github.com/romkatv/powerlevel10k

## OTHER
*p.s. I use [archcraft](https://archcraft.io/) instead of regular arch.*

For fallout terminal grub background (if using same distro)
```bash
cp background.png /boot/grub/themes/archcraft/
```
BSPWM is just copy/paste if you want my setup.

Recommended apps. Hopefully they're all in your package manager :)
```bash
sudo pacman -S neovim kitty zsh lazygit lazydocker docker lolcat espeak-ng playerctl
firefox steam ttf-liberation postman corectrl discord spotify moonlight
```
```
yay -S vibrant
```
