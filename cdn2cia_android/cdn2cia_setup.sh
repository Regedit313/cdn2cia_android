#!/data/data/com.termux/files/usr/bin/bash

clear

cd "$(dirname "$0")" || exit 1

echo
echo "cdn2cia_android setup"
echo

echo "Creating project folders..."

mkdir -p auto_in
mkdir -p auto_out

echo
echo "Updating Termux..."
pkg update -y
pkg upgrade -y

if [ ! -d ~/storage/shared ]; then
    echo
    echo "Setting up storage..."
    termux-setup-storage
else
    echo
    echo "Storage is already configured."
fi

echo
echo "Installing Python..."
pkg install python -y

echo
echo "PyCryptodomeX Installation"
echo
echo "1) Online version (recommended)"
echo "2) Offline version (offline/)"
echo

read -p "Choose [1 or 2] (default: 1): " choice

if [ "$choice" = "2" ]; then

    echo
    echo "Installing from offline package..."

    if ls offline/pycryptodomex*.tar.gz >/dev/null 2>&1; then
        if pip install offline/pycryptodomex*.tar.gz; then
            echo "PyCryptodomeX successfully installed from offline package."
        else
            echo
            echo "Error: offline installation failed."
            echo "Please verify the offline package and run cdn2cia_setup.sh again."
            echo
            read -p "Press Enter to continue..."
            exit 1
        fi
    else
        echo
        echo "Error: no offline PyCryptodomeX package found."
        echo "Please copy pycryptodomex*.tar.gz to the offline folder."
        echo "Then run cdn2cia_setup.sh again to complete the installation."
        echo
        read -p "Press Enter to continue..."
        exit 1
    fi

else

    echo
    echo "Installing from Internet..."

    if pip install pycryptodomex; then
        echo "PyCryptodomeX successfully installed from Internet."
    else
        echo
        echo "Online installation failed."
        echo "Trying offline package..."

        if ls offline/pycryptodomex*.tar.gz >/dev/null 2>&1; then
            if pip install offline/pycryptodomex*.tar.gz; then
                echo "PyCryptodomeX successfully installed from offline package."
            else
                echo
                echo "Error: offline installation failed."
                echo "Please verify the offline package and run cdn2cia_setup.sh again."
                echo
                read -p "Press Enter to continue..."
                exit 1
            fi
        else
            echo
            echo "Error: no offline PyCryptodomeX package found."
            echo "Please copy pycryptodomex*.tar.gz to the offline folder."
            echo "Then run cdn2cia_setup.sh again to complete the installation."
            echo
            read -p "Press Enter to continue..."
            exit 1
        fi
    fi

fi

echo
echo "Installation completed."
echo
read -p "Press Enter to continue..."
