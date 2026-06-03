#!/data/data/com.termux/files/usr/bin/bash

mkdir -p cdn_folder
mkdir -p auto_in
mkdir -p auto_out

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