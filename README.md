# My Dot files

Mostly for personal use. But feel free to use these if you are setting up
your system.

### Standard rc files

- `.bashrc` (config file for bash)
- `.zshrc` (config file for zsh)
- `.vimrc` (config file for vim)
- `.Xdefaults` (config file for urxvt)
- `aliases` (some aliases for bash/zsh that I commonly use)
- `source_list` (list of commands to run before starting terminal)

### Config folder for a few programs

The folders present in `config` folder are generally present in `~/.config`

Note: You might want to check documentation for each program to make sure
that these files are being used instead of defaults. For example, you have to 
execute `ranger --copy-config=all` and replace existing `.config/ranger` with
the one present in this repository to see the changes.

### i3

Config file and some useful bash scripts from `~/.i3/` are placed in this folder.

On fresh install of i3, the config file might be present in `~/.config/i3/`. You 
might wanna delete this and create `~/.i3/`.

### vim

Files for vim terminal editor are present in this folder. This is generally 
named `~/.vim/`.

`.vim/plugged` is ignored here because the folders present inside
are individual git repositories with their own `.git` files. Including these will
not only be a mess but also considered plagarism. These are not important in most
of the cases. These will be created when running `:PlugInstall` in vim.

### urxvt

Plugins for urxvt terminal emulator are present in this folder. This is generally
named `~/.urxvt/`.

### Update script

`update_dotfiles.sh` is a simple shell script which updates the files in 
this folder by copying files and folders from different locations. This makes 
maintaining dotfiles a little bit easier.

