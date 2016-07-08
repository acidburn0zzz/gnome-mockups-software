#!/bin/bash

for f in *; do
  if [[ -d $f && ! "$f" == "C" ]]; then
    echo "translating into $f"
    msgfmt -o $f/$f.mo $f/$f.po
    itstool -m $f/$f.mo -o $f/ C/*svg
    for s in $f/*svg; do
      echo inkscape -e $s.png $s
    done
  fi
done


