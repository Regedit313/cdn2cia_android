#!/data/data/com.termux/files/usr/bin/bash

echo "Creating project folders..."

mkdir -p auto_in
mkdir -p auto_out
mkdir -p cdn_folder

echo ""
echo "Updating Termux..."
pkg update -y
pkg upgrade -y

if [ ! -d ~/storage/shared ]; then
    echo "Setting up storage..."
    termux-setup-storage
else
    echo "Storage is already configured."
fi

echo "Installing Python..."
pkg install python -y

echo ""
echo "PyCryptodomeX Installation"
echo "1) Online version (recommended)"
echo "2) Offline version (offline/)"
read -p "Choose [1 or 2] (default: 1): " choice

if [ "$choice" = "2" ]; then

    echo "Installing from offline package..."

    if ls offline/pycryptodomex*.tar.gz >/dev/null 2>&1; then
        if pip install offline/pycryptodomex*.tar.gz; then
            echo "PyCryptodomeX successfully installed from offline package."
        else
            echo "Error: offline installation failed."
            echo "Please verify the offline package and run cdn2cia_setup.sh again."
            exit 1
        fi
    else
        echo "Error: no offline PyCryptodomeX package found."
        echo "Please copy pycryptodomex*.tar.gz to the offline folder."
        echo "Then run cdn2cia_setup.sh again to complete the installation."
        exit 1
    fi

else

    echo "Installing from Internet..."

    if pip install pycryptodomex; then
        echo "PyCryptodomeX successfully installed from Internet."
    else
        echo "Online installation failed."
        echo "Trying offline package..."

        if ls offline/pycryptodomex*.tar.gz >/dev/null 2>&1; then
            if pip install offline/pycryptodomex*.tar.gz; then
                echo "PyCryptodomeX successfully installed from offline package."
            else
                echo "Error: offline installation failed."
                echo "Please verify the offline package and run cdn2cia_setup.sh again."
                exit 1
            fi
        else
            echo "Error: no offline PyCryptodomeX package found."
            echo "Please copy pycryptodomex*.tar.gz to the offline folder."
            echo "Then run cdn2cia_setup.sh again to complete the installation."
            exit 1
        fi
    fi

fi

echo ""
echo "Installation completed."