#!/bin/sh
#echo "HTTP/1.1 200 OK"
echo "Content-type:multipart/x-mixed-replace;boundary=NEXT"
echo ""
echo "--NEXT"
while true
do
		echo "Content-type: text/html"
		echo ""
		echo "<HTML>"
		echo "<HEAD>"
		echo "<TITLE>Informations sur la batterie</TITLE>"
		echo "</HEAD>"
		echo "<BODY>"
		echo "<H3>Informations sur la batterie</H3>"
		echo "Date : "
		date
		echo "<p>"
		echo "Processus : "
		echo $$
		echo "<p>"
		echo "<pre>"
		cat /proc/acpi/battery/BAT0/state
		echo "</pre>"
		echo "</body>"
		echo "</html>"
		echo "--NEXT"
		sleep 2
done