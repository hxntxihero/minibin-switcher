<img width="1600" height="834" alt="minibin final" src="https://github.com/user-attachments/assets/8378c3ae-9eba-4354-973d-64d26ef1aa6c" />


# minibin icons switcher

some mini automated script to synchronize minibin icons with windows (10 and 11) system themes (light/dark mode). 
please use it with autodarkmode.

## features
- automatically detects minibin installation paths in appdata
- swaps icon sets and refreshes the tray icon automatically
- ensures the process is safely restarted to apply changes instantly

## structure
ensure your folder is organized as follows:
```text
├── switcher.ps1
├── run.bat
└── icons/
    ├── black/
    └── white/
```
## important: minibin setup

for this script to work without permission errors, you must move your minibin installation:

    1. go to your minibin folder.

    2. move minibin.exe and its files to %appdata%\minibin. (or roaming)
    

## how to use with autodarkmode?

    1. open autodarkmode and go to the scripts section.

    2. add a new script and point it to the run.bat file in this folder.

    3. in the scripts.yaml file, use single quotes for paths to avoid errors:
    
    Command: 'C:\path\to\your\folder\run.bat'
    ArgsLight: ["Light"]
    ArgsDark: ["Dark"]
    
    
## notes
- if the empty icon looks stock, rename or delete the res file in your minibin appdata folder.
- the script uses a small delay to ensure windows finishes the theme transition before swapping icons.
