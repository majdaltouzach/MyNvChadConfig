# Install Instructions
### Install on Windows using **Command Prompt**:
```bash
git clone https://github.com/majdaltouzach/MyNvChadConfig.git %USERPROFILE%\AppData\Local\nvim && nvim  
```
### Install on Windows using **PowerShell (pwsh)**:
```bash 
git clone https://github.com/NvChad/starter $ENV:USERPROFILE\AppData\Local\nvim && nvim
```

### Install on MacOS & Linux:
```bash 
git clone https://github.com/majdaltouzach/MyNvChadConfig.git ~/.config/nvim && nvim
```
# Other Important Documentation:

**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
