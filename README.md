# cdn2cia_android

## Installation

1. Install Termux.

2. Copy the "cdn2cia_android" folder to the root of internal storage.

3. Open Termux and run:

termux-setup-storage

(When prompted, allow Termux to access all files on your device storage.)

4. Start cdn2cia:

bash ~/storage/shared/cdn2cia_android/cdn2cia.sh

(The scripts can be launched from any location in Termux.)

5. IMPORTANT:

For the first use, before using any other menu option, select:

9 = Run first-time setup (required before first use)

When prompted, choose:

1) Online installation (recommended)

2) Offline installation (requires a pycryptodomex*.tar.gz file in the offline folder)

This step installs all required dependencies and prepares the project folders.

The first-time setup must be completed before using any other menu option.

6. Copy one or more game CDN folders into "auto_in/".

7. Select:

1) Convert CDN folders to .CIA


## Menu

When started, cdn2cia.sh provides the following options:

1) Convert CDN folders to .CIA

9) Run first-time setup (required before first use)

0) Exit


## Input

Place one game CDN folder per game inside "auto_in/".

Example:

auto_in/

---- game1/

-------- 00000000

-------- 00000001

-------- 00000002

-------- tmd.0

-------- tmd.1040

---- game2/

-------- 00000000

-------- 00000001

-------- tmd.0


## Output

Converted .CIA files will be created in "auto_out/".

Example:

auto_out/

---- game1.cia

---- game2.cia


## Folder Structures

### Folder Structure Before Running cdn2cia.sh

cdn2cia_android/

---- README.md

---- original_ntool.md

---- ntool.py

---- cdn2cia_setup.sh

---- cdn2cia.sh

---- offline/

-------- pycryptodomex-3.23.0.tar.gz

---- auto_in/

-------- game1/

------------ 00000000

------------ 00000001

------------ 00000002

------------ tmd.0

------------ tmd.1040

-------- game2/

------------ 00000000

------------ 00000001

------------ tmd.0

---- auto_out/

---- cdn_folder/


### Folder Structure After Running cdn2cia.sh

cdn2cia_android/

---- README.md

---- original_ntool.md

---- ntool.py

---- cdn2cia_setup.sh

---- cdn2cia.sh

---- offline/

-------- pycryptodomex-3.23.0.tar.gz

---- auto_in/

---- auto_out/

-------- game1.cia

-------- game2.cia

---- cdn_folder/


## Notes

The required folders are created during the first-time setup and are automatically recreated when launching cdn2cia.sh if they do not already exist.

"auto_in/" is automatically cleaned when a game is successfully converted.

"auto_out/" contains the final .CIA files.

"cdn_folder/" is used as a temporary working directory and is automatically cleaned after processing.

If a conversion fails, the corresponding game folder remains in "auto_in/" for troubleshooting.

"README.md" contains the Android/Termux guide for CDN to .CIA conversion.

"original_ntool.md" contains the original NTool documentation and advanced commands.


## Credits

This project is based on ntool by Kc57.

Original repository:
https://github.com/Kc57/ntool

This repository provides an Android/Termux setup and automated CDN to .CIA conversion workflow.
