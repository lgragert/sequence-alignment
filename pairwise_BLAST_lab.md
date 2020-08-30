

# Pairwise Sequence Alignment and Basic Local Alignment Search Tool (BLAST)

Loren Gragert, PhD
Department of Pathology and Laboratory Medicine
Tulane School of Medicine



## INSTALLATION INSTRUCTIONS


If you have MacOS, follow the text file `installation_guide_mac.txt`
If you have Windows, follow the text file `installation_guide_windows.txt`



## INSTRUCTIONS FOR RUNNING BLAST WEB TOOL



The mammalian genome has abundant transposable elements that consist of DNA 
transposons and retrotransposons. Retrotransposons are a subclass that mobilize
through RNA intermediates. They closely resemble and hence may be derived from 
retrovirus. The high density of transposable element in the human genome may have
evolutionary significance with a vital role in normal physiology as well as 
pathogenesis. A recent study showed that LINE-1 retroelements in neurons alter
brain development.

One such example of retrotransposons has potential neurological significance. 
Synaptic plasticity of neurons governs the learning and adaptive capability of
the brain and this is reported to be hampered in disorders like Alzheimer's 
disease, schizophrenia etc. The Arc gene that encodes Activity Regulated 
Cytoskeleton Associated Protein is essential for synaptic plasticity. A recent 
study by Pastuzyn et al., indicates that Arc gene encodes a retrotransposon 
and has indicated it's similarity with a retroviral protein.

In this exercise we will find out if there is any homology of this 
retrotransposon with retroviruses.

1. Open the BLAST home page at https://blast.ncbi.nlm.nih.gov/Blast.cgi

2. Select on the Nucleotide BLAST page and then either paste the ARC nucleotide 
   fasta sequence (file provided) or enter the accession number or upload the 
   FASTA file (provided)

3. Give your submission job a title, select a database (nr/nt is default or 
   choose refSeq representative genomes), run BLAST

4. To run the BLAST only for viruses or retroviruses type "Viruses" or 
   Retro-transcribing viruses" in Organism column
5. Are there any viral nucleotide sequences that show homology to ARC 
   nucleotide sequence?
6. Run BLAST and try changing the Expect threshold and Max target sequences 
   etc. to see changes in the output of similar results.



## INSTRUCTIONS FOR RUNNING BIOPYTHON BLAST SCRIPT



Biopython is an Python packges that has classes and modules that can 
be used for bioinformatics tasks.

BLAST can be run locally using NCBI standalone BLAST tool.

BioPython can also run BLAST and parse detailed output for further analysis.



## Commands to run in Terminal (iTerm/Cygwin) 

Change to the working directory where you downloaded all the scripts

```
cd ~/dev/sequence-alignment/
```

Change permissions on shell scripts to make executable:

```
chmod 775 *.sh
```



## Install BLAST locally and make viral protein DB

If MacOS:

```
bash blast_setup_mac.sh
```

If Windows:

```
bash blast_setup_windows.sh
```



## Runs NCBI local blast of ARC protein sequence against viral proteome 

```
bash blast_local_run.sh 
```

BLAST output is stored as `BLAST_ARC_output.txt`



## Run NCBI BLAST using web service by Biopython  

```
python3 biopython_blast.py 
```

BLAST output is stored as `BLAST_ARC_output.xml`



## Parse the XML file returned by BLAST web service using BioPython

```
python3 blast_output_parser.py 
```

Prints out list of viral protein hits to standard out.

BLAST output is stored as `BLAST_ARC_results.csv`



## Exercise for In-Class Lab:

Human cytomegalovirus has a gene called UL111A that is a homolog to IL-10. This viral protein can bind to the human IL-10 receptor and compete with human IL-10 for binding sites.

Download the FASTA sequence for UL111A from its Uniprot entry (https://www.uniprot.org/uniprot/F5HC71) and BLAST against the same viral protein database. Is this sequence in the viral protein database?

Next find and download the FASTA protein sequence for human IL-10 and BLAST against the same viral protein database. Which viral protein has the highest score?

See if you can modify the local BLAST and Biopython scripts to run with these IL-10 related FASTA files instead of ARC.

