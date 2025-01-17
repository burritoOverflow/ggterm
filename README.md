# ggterm

My terminal configuration for C++ development with Vim.

**Warning: use at your own risk. Using this repo can mess up your existing environment! It is highly recommended to first try it out in a fresh VM!**

<a href="https://i.imgur.com/wHmDf5N.png" target="_blank">![screenshot-0](https://i.imgur.com/wHmDf5N.png)</a>

## Quick start

The repo is meant to be used on Ubuntu 18.04+ but could also work on Mac OS with some adaptations.

```bash
sudo apt-get install vim g++ cmake python-setuptools python3-pip clangd-10
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100

git clone https://github.com/ggerganov/ggterm --recursive
cd ggterm

./install.sh

# optionally add "source ~/.myenv" at the end of your ~/.bashrc
```

After install, open `vim` and run `:PlugInstall`.

After, navigate to `YouCompleteMe` and run the [install](https://ycm-core.github.io/YouCompleteMe/) process under "_Compile YCM_":

```bash
cd ~/.vim/plugged/YouCompleteMe
```

## Vim C++ features

Vim is configured with the following plugins:

- YouCompleteMe
- NERDTree
- Fugitive
- fzf
- vimspector
- etc.

To enable all features make sure to have a `compile_commands.json` file in the root source directory of your project.
When using CMake, I usually create it like this:

```
cd /path/to/project
ln -sf ./build/compile_commands.json
```

My Vim usage is tab-oriented. Check the [.vimrc](.vimrc) file for all available shortcuts. Here is a partial list for convenience:

| Action   | Shortcut                                   |
| -------- | ------------------------------------------ |
| tn       | open new tab                               |
| tc       | clone current tab                          |
| t[0-9]   | switch to tab [0-9]                        |
| tm[0-9]  | move tab to position [0-9]                 |
| ;d       | go to definition                           |
| ;r       | list all references                        |
| \gl      | all commits                                |
| \ga      | commits for current file                   |
| \gdc     | go to declaration                          |
| \rs      | remove all trailing spaces                 |
| \lf      | clang-format                               |
| \gH      | open line in Github                        |
| \gB      | blame line in Github                       |
| Ctrl + f | fuzzy search file                          |
| Ctrl + p | fuzzy search text                          |
| Ctrl + o | switch between source and header file      |
| Ctrl + n | toggle NERD tree                           |
| Ctrl + l | open NERD tree in current folder           |
| Ctrl + k | fuzzy search current text under cursor     |
| F5       | Start debugging                            |
| F5       | Continue until break                       |
| F10      | Step over                                  |
| F11      | Step into                                  |
| F12      | Complete the current funcion               |
| F9       | Toggle breakpoint                          |
| F3       | Stop debugging                             |
| F4       | Start again with same options              |
| F6       | Interrupt the debuger                      |
| F7       | Add watch expression from visual selection |
| \F8      | Run to cursor                              |
