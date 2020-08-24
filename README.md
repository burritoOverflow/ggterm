# ggterm

My terminal configuration for C++ development with Vim.

**Warning: use at your own risk. Using this repo can mess up your existing environment**

<a href="https://i.imgur.com/wHmDf5N.png" target="_blank">![screenshot-0](https://i.imgur.com/wHmDf5N.png)</a>

## Quick start

```bash
sudo apt-get install vim g++ cmake python-setuptools python3-pip clangd-10
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100

pip3 install --user pynvim

git clone https://github.com/ggerganov/ggterm --recursive
cd ggterm

./install.sh
```

## Vim C++ features

To enable all features make sure to have a `compile_commands.json` file in the root source directory of your project.
When using CMake, I usually create it like this:

```
cd /path/to/project
ln -sf ./build/compile_commands.json
```

My Vim usage is tab-oriented. Check the [.vimrc](.vimrc) file for all available shortcuts. Here is a partial list for convenience:

| Action | Shortcut |
| ------ | ------ |
| tt | open new tab |
| tc | clone current tab |
| t[0-9] | switch to tab [0-9] |
| ;d | go to definition |
| ;r | list all references |
| \gdc | go to declaration |
| Ctrl + f | fuzzy search file |
| Ctrl + p | fuzzy search text |
| Ctrl + o | switch between source and header file |
| Ctrl + n | toggle NERD tree |
| Ctrl + l | open NERD tree in current folder |
| Shift + k | fuzzy search current text under cursor |
