#!/usr/bin/env gawk -f

/-- # /          { out=$3".md"; print "">out  }
/-- ## / && out  { print "<a name="$3">">>out }
/-- |/ &&/Does/     { doing=1            } 
/-- |/ &&/Has/      { doing=0            } 
doing && $3=="|" { $4="["$4"](#"$4")" }
out              { print $0>>out      }
