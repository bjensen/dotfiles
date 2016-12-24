!/bin/bash
shopt -s nullglob
for f in *.pdf
do
  echo "Sent to printer: $f"
  lp -o page-ranges=1 "$f"
done
