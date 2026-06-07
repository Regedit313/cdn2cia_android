#!/data/data/com.termux/files/usr/bin/bash

cd "$(dirname "$0")" || exit 1

mkdir -p auto_in
mkdir -p auto_out

while true; do
    clear

    echo
    echo "cdn2cia_android"
    echo
    echo "1) Convert CDN folders to .CIA"
    echo "9) Run first-time setup (required before first use)"
    echo "0) Exit"
    echo

    read -p "Choose what to do: " choice

    case "$choice" in

        1)
            clear

            echo "Convert CDN folders to .CIA"
            echo

            mkdir -p tmp_folder

            for D in auto_in/*/; do
                [ -d "$D" ] || continue

                game="$(basename "$D")"

                echo "Processing: $game"

                rm -rf tmp_folder/*
                cp -r "$D"* tmp_folder/

                rm -f out.cia

                python3 ntool.py cdn2cia tmp_folder --out out.cia

                if [ -f out.cia ]; then
                    mv out.cia "auto_out/$game.cia"
                    echo "Created: auto_out/$game.cia"

                    rm -rf "$D"
                else
                    echo "Error: no out.cia created for $game"
                fi

                echo
            done

            rm -rf tmp_folder

            rm -rf __pycache__
            rm -rf lib/__pycache__

            echo "Done."
            echo
            read -p "Press Enter to continue..."
            ;;

        9)
            clear
            bash ./cdn2cia_setup.sh
            ;;

        0)
            clear
            exit 0
            ;;

        *)
            echo
            echo "Invalid choice."
            sleep 1
            ;;
    esac
done
