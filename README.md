Readme For runningt4f.pl, KO2Path and Path2Class
------------------------------------------------------------------------

These Scripts Are developed to help researchers analyze Tax4Fun Output 
and carry out a in-dpet functional analysis of the Amplicon Metagenomics 
dataset. These scripts will take Tax4Fun Output and fetch all the KO IDs
from them and then connect to Kegg Server to extract:
1) KO2Path: Pathway Information for each KO ID.
2) Path2Class: Class and Subclass of each Pathway identified in previous
			   step.

Each Step creates output as a normalized profile matrix having
respective information in coloumns, where each coloumn denotes the
sample ID.

The entries from KEGG are saved on Your local disk so that we dont have 
to connect to internet to retrive the files everytime we would like to 
run the script.

Both KO2Path and PathClass are provided with function of inputting 
keyword, to analyze context specific pathway or class:
1) If provided in KO2Path there will be an additional pathway keyword 
   profile generated, with all the molecules whose pathways have the 
   keyword in thier name. e.g. if you would like to explore all  
   molecules that are from pathway like Methane metabolism present in  
   your dataset then in KO2Path step you can use key word  
   "Methane metabolism".
2) If provided in Path2Class there will be an additional class keyword 
   profile generated, with all the pathways whose class/sub-class title 
   has your keyword. e.g. if you would like to explore all  
   pathways that are from a perticular sub-class like Energy metabolism 
   present in your dataset then in Path2Class step you can use key word  
   "Energy".

Pre-requisites:
cURL-	(usually installed on linux)
		available from most Linux Repositories or source from :
		https://curl.haxx.se/download.html

Tax4Fun-To run and acquire output. Tax4Fun can be downloaded from :
		http://tax4fun.gobics.de/  
		Tax4Fun has its own requirements that includes 
		R-statistical package
		Tax4Fun SILVA reference data (available on the link above)

PERL-	 ALso Installed on LInux by default if not would be available 
		On repository, if still not download from: 
		https://www.perl.org/get.html#unix_like

Statistics::R package:
		install with the command:
		`cpan cpan install Statistics::R`
************************************************************************
Please NOTE: At every stage when requested to enter the path make sure 
			 you enter the path with the trailing "/";
************************************************************************
************************************************************************
Please cite:
xxxxx
************************************************************************

STEP1: Run Tax4Fun
----------------
Note the path of tsv format of Qiime Biom made using SILVA. if biom is
in binary/hdf5 format convert it using:
`biom convert -i <BIOM FILE> -o <OUT FILE NAME> --to-tsv --header-key taxonomy`

You can run Tax4Fun with the Script provided:
`perl runningt4f.pl`
first you will be prompted for SILVA reference data Folder, usually 
ending with : "SILVA123/" for version 123. please enter full path

next you will be prompted for FOLDER where the input file and output 
file would be present.
(please note: do not provide path to input file here)

Then you will be prompted for input tsv file name which would be present 
in the above folder

STEP2: Run KO2Path
-------------------
In this step we will convert the Tax4Fun Output into a Pathways profile
based on information present on KEGG database and Tax4Fun output.

Make sure your internet connection is working. If you are behind a 
institution proxy you will need to enter the following command:
`export http_proxy=http://proxyUsername:Password@Proxyaddress:Port`

KO2Path usage :
./KO2Path <inputfile> "<keyword>" <KEGG_Storage_folder>

This has to be run from the folder where the script is present

<inputfile> would have the COMPLETE path of the Tax4fun output.

<keyword> would be the pathway whose all the molecule you would like to 
see specially in a seperate file . leave blank if not required but still 
leave "".

<KEGG_Storage_folder> would be the folder where you would like to store 
the KEGG files for quicker access. make sure the directory exists.

The output would be save in the same folder as your input file.

STEP3: Run Path2Class
----------------------
In this step we will convert the KO2Path Output into a Pathways profile
based on information present on KEGG database and Tax4Fun output.

KO2Path usage :
./Path2Class <inputfile> "<keyword>" <KEGG_Storage_folder>

This has to be run from the folder where the script is present

<inputfile> would have the COMPLETE path of the Tax4fun output.

<keyword> would be the pathway whose all the molecule you would like to 
see specially in a seperate file . leave blank if not required but still 
leave "".

<KEGG_Storage_folder> would be the folder where you would like to store 
the KEGG files for quicker access. make sure the directory exists.

The output would be save in the same folder as your input file.
