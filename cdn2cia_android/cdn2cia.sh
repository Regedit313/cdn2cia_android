#!/data/data/com.termux/files/usr/bin/bash

cd "$(dirname "$0")" || exit 1

mkdir -p cdn_folder
mkdir -p auto_in
mkdir -p auto_out

while true; do
    echo ""
    echo "cdn2cia_android"
    echo ""
    echo "1) Convert CDN folders to .CIA"
    echo "9) Run first-time setup (required before first use)"
    echo "0) Exit"
    echo ""

    read -p "Choose what to do: " choice

    case "$choice" in

        1)
            for D in auto_in/*/; do
                [ -d "$D" ] || continue

                game="$(basename "$D")"

                echo "Processing: $game"

                rm -rf cdn_folder/*
                cp -r "$D"* cdn_folder/

                rm -f out.cia

                python3 ntool.py cdn2cia cdn_folder --out out.cia

                if [ -f out.cia ]; then
                    mv out.cia "auto_out/$game.cia"
                    echo "Created: auto_out/$game.cia"

                    # Remove only the folder successfully processed
                    rm -rf "$D"
                else
                    echo "Error: no out.cia created for $game"
                fi
            done

            rm -rf cdn_folder/*

            echo "Done."
            ;;

        9)
            bash ./cdn2cia_setup.sh
            ;;

        0)
            echo "Exit."
            exit 0
            ;;

        *)
            echo "Invalid choice."
            ;;

    esac
done