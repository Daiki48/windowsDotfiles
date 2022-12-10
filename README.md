# windowsDotfiles
dotfiles for windows

# symbolicLink

## Run by administrator

Administrator privilege required for this operation.

- nvim 

```shell
$ New-Item -ItemType SymbolicLink -Path .\AppData\Local\nvim -Target .\windowsDotfiles\AppData\Local\nvim\
```

- PowerShell

```shell
New-Item -ItemType SymbolicLink -Path C:\Users\daiki\Documents\PowerShell\ -Target C:\Users\daiki\windowsDotfiles\Documents\PowerShell\
```

- .vimrc

```shell
New-Item -ItemType SymbolicLink -Path C:\Users\daiki\.vimrc -Target C:\Users\daiki\windowsDotfiles\.vimrc
```
