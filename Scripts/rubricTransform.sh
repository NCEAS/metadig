#!/usr/local/bin/bash
## Recommendation Translations

CrosswalkHome="/Users/scgordon/Crosswalks"

declare -A spiralLists
spiralLists[ACDD]="ACDD_highlyRecommended,ACDD_recommended,ACDD_suggested"
spiralLists[CSW]="CSWCoreQueryables,CSWCoreReturnables,CSWAdditionalQueryables"
spiralLists[DCITE]="DataCite3.1Mandatory,DataCite3.1Recommended,DataCite3.1Optional"
spiralLists[UMM-C]="UMM-C_Required,UMM-C_HighlyRecommended,UMM-C_Recommended"
spiralLists[ISO-1]="ISO-1_Discovery-Mandatory,ISO-1_Discovery-Conditional,ISO-1_Discovery-Optional"
spiralLists[LTER]="LTER_Identification,LTER_Discovery,LTER_Evaluation"
spiralLists[FGDC]="FGDC_Discovery-Mandatory"
echo Transform spiral list: ${spiralLists[$1]}
echo /Users/scgordon/metadig/RubricTransforms/$2/rubric_$1_$2 

java net.sf.saxon.Transform \
-s:$CrosswalkHome/AllCrosswalks.xml \
-xsl:$CrosswalkHome/crosswalks.xsl \
dialectDisplayListString=$2 \
displayFormat=jsonRubric \
rubricDialect=$2 \
rubricType=$1 \
spiralDisplayListString=${spiralLists[$1]} \
> /Users/scgordon/metadig/RubricTransforms/$2/rubric_$1_$2.xsl


