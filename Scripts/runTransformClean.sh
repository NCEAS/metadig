#!/bin/bash
mkdir -p /Users/scgordon/metadig/result/CleanEML2.1.1/$1/$3/reports/ |
if [ $# = 3 ]; then
    java net.sf.saxon.Transform \
    -s:/Users/scgordon/metadig/result/dummy.xml \
    -xsl:/Users/scgordon/metadig/RubricTransforms/$3/rubric_$2_$3.xsl \
    fileNamePattern=*.xml \
    recordSetPath=/Users/scgordon/metadig/result/CleanEML2.1.1/$1/$3/XML \
    > /Users/scgordon/metadig/result/CleanEML2.1.1/$1/$3/reports/rubric_$2_$3.json
else
    echo 'runTransform collection (GHRC) rubric (CSW) dialect (DIF)'
fi
