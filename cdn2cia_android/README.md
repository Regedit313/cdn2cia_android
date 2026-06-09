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

For the first use, before the first conversion, select:

9 = Run first-time setup (required before first use)

When prompted, choose:

1 = Online installation (recommended)

2 = Offline installation (requires a pycryptodomex*.tar.gz file in the offline folder)

This step installs all required dependencies and prepares the project folders.

The first-time setup must be completed before the first conversion.

6. Copy one or more game CDN folders into:

auto_in/

7. Select:

1 = Convert CDN folders to .CIA

---

## Menu

When started, cdn2cia.sh provides the following options:

1 = Convert CDN folders to .CIA

9 = Run first-time setup (required before first use)

0 = Exit

---

## Convert CDN Folders to .CIA

Place one game CDN folder per game inside:

auto_in/

When option 1 is selected, the script automatically:

- Copies the CDN contents to a temporary working folder
- Converts the CDN data to a .CIA file using NTool
- Creates the final .CIA file in auto_out/
- Removes successfully converted game folders from auto_in/
- Cleans temporary files automatically

Multiple game folders can be converted in a single operation.

---

## Input

Place one game CDN folder per game inside:

auto_in/

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

---

## Output

Converted .CIA files are created in:

auto_out/

Example:

auto_out/

---- game1.cia

---- game2.cia

Successfully converted game folders are automatically removed from auto_in/.

---

## Folder Structures

### Folder Structure Before Conversion

cdn2cia_android/

---- README.md

---- original_ntool.md

---- ntool.py

---- cdn2cia.sh

---- cdn2cia_setup.sh

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

---

### Folder Structure After Conversion

cdn2cia_android/

---- README.md

---- original_ntool.md

---- ntool.py

---- cdn2cia.sh

---- cdn2cia_setup.sh

---- offline/

-------- pycryptodomex-3.23.0.tar.gz

---- auto_in/

---- auto_out/

-------- game1.cia

-------- game2.cia

---

## Notes

The required folders are automatically created if they do not already exist.

Successfully converted game folders are automatically removed from auto_in/.

If a conversion fails, the corresponding game folder remains in auto_in/ for troubleshooting.

Temporary working folders are automatically created only when needed and are automatically removed when conversion is finished.

Temporary Python cache folders (__pycache__) are automatically removed after conversion.

auto_out/ contains the final .CIA files.

README.md contains the Android/Termux guide for CDN to .CIA conversion.

original_ntool.md contains the original NTool documentation and advanced commands.

---

## Credits

This project is based on ntool by Kc57.

Original repository:

https://github.com/Kc57/ntool

This repository provides an Android/Termux setup and automated CDN to .CIA conversion workflow.
