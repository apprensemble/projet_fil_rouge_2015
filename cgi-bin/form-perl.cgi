#!/usr/bin/perl

local ($buffer, @pairs, $pair, $name, $value, %FORM);

$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;

if ($ENV{'REQUEST_METHOD'} eq "GET")
{
		$buffer = $ENV{'QUERY_STRING'};
}

@pairs = split(/&/, $buffer);
foreach $pair (@pairs)
{
		($name, $value) = split(/=/, $pair);
		$value =~ tr/+/ /;
		$value =~ s/%(..)/pack("C", hex($1))/eg;
		$FORM{$name} = $value;
}
$prenom = $FORM{prenom};
$nom  = $FORM{nom};

print "Content-type:text/html\r\n\r\n";
print "<html>";
print "<head>";
print "<title>Analyse des données saisies</title>";
print "</head>";
print "<body>";
print "REQUEST_METHOD  = $ENV{'REQUEST_METHOD'}", "<BR>", "\n";
print "QUERY_STRING = $ENV{'QUERY_STRING'}", "<BR>", "\n";
print "<HR>";
print "<h2>Bonjour <U>$prenom $nom</U>, comment allez-vous ?</h2>", "\n";
print "<A HREF=http://testhost/~tintin/form/exemple-form.html>réessayer</A>";
print "</body>";
print "</html>";

1;
