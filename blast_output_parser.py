#!/usr/bin/env python3

import os
import Bio
from Bio.Blast import NCBIXML


out_filename = "BLAST_results.csv"
out_file = open(out_filename, "w")
out_file.write("Viral_protein" + "," + "E-value" + "," + "Length" + "," + "Raw_score" + "," + "Bit_score" + "," + "hsp_query" + "," + "hsp_match" + ","
	+ "hsp_sbjct" + "," + "Gaps" + "\n")




in_file = "blast_output.xml"
result_handle = open(in_file)
blast_records=NCBIXML.parse(result_handle)
blast_record = next(blast_records)

for alignment in blast_record.alignments:
	for hsp in alignment.hsps:
		title_split = alignment.title.split(" ")


		viral_protein = title_split[2:]
		viral_protein = " ".join(viral_protein)
		e_value = hsp.expect
		alignment_length = alignment.length
		raw_score = hsp.score
		bit_score = hsp.bits
		segment_match = hsp.match[0:100]
		segment_query = hsp.query[0:100]
		segment_sbjct = hsp.sbjct[0:100]
		gaps = hsp.gaps

		print(viral_protein)

		out_file.write(str(viral_protein) + "," + str(e_value) + "," + str(alignment_length) + "," + str(raw_score) + "," + str(bit_score) + "," +
			str(segment_query) + "," + str(segment_match) + "," + str(segment_sbjct) + "," + str(gaps) + "\n")



out_file.close()
