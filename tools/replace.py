#!/usr/bin/env python
############################################################################
#
# Author: Francisco Yumiceva
# yumiceva@fnal.gov
#
# Fermilab, 2013
#
############################################################################

"""


"""

import sys

old_str = sys.argv[1]
new_str = sys.argv[2]

old_file = open(sys.argv[3])
new_file = open(sys.argv[4],'w')

for line in old_file:
    newline = line.replace( old_str, new_str )
    #if line.find( old_str ):
    #    newline = line.replace( old_str, new_str )
    new_file.write( newline )

old_file.close()
new_file.close()



