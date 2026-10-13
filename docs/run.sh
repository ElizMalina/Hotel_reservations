#!/bin/bash
xmllint --noout --valid tz.xml
xsltproc tz.xsl tz.xml > tz.txt
