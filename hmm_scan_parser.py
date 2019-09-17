#!bin/env/python3


import Bio, os

from Bio import SearchIO

### This will through the experimental phase warning


scan_result = SearchIO.read('hmmscan.hmmer3-text', 'hmmer3-text')
scan_result
print(scan_result)