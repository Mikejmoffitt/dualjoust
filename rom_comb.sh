#!/bin/bash

# Prepares a dual Joust / Robotron image meant to be put on a 29F010 FLASH rom,
# though it can also be put on a 27C010 EPROM, or any parallel memory >= 1024k.
# If you just use the 512k image of joust or robotron, a single ROM can replace
# the 12 individual ROMs in a machine if needed. 

# Combine the 12 joust images into a single 512kbit image. Note the gap between
# $9000 and $CFFF, which is not used for ROM space on the machine but rather 
# for WMS specific I/O.

cat j/*.1b > joust.512
cat j/*.2b >> joust.512
cat j/*.3b >> joust.512
cat j/*.4b >> joust.512
cat j/*.5b >> joust.512
cat j/*.6b >> joust.512
cat j/*.7b >> joust.512
cat j/*.8b >> joust.512
cat j/*.9b >> joust.512
cat blank.fff >> joust.512
cat blank.fff >> joust.512
cat blank.fff >> joust.512
cat blank.fff >> joust.512
cat j/*.10b >> joust.512
cat j/*.11b >> joust.512
cat j/*.12b >> joust.512

# Make a 512kbit image for Robotron as well, following the same memory mapping.
# Note: these names are just based on common distribution names. They can be 
# changed to match whatever rom set you have so long as the order is kept.

cat r/*.sb1 > robotron.512
cat r/*.sb2 >> robotron.512
cat r/*.sb3 >> robotron.512
cat r/*.sb4 >> robotron.512
cat r/*.sb5 >> robotron.512
cat r/*.sb6 >> robotron.512
cat r/*.sb7 >> robotron.512
cat r/*.sb8 >> robotron.512
cat r/*.sb9 >> robotron.512
cat blank.fff >> robotron.512
cat blank.fff >> robotron.512
cat blank.fff >> robotron.512
cat blank.fff >> robotron.512
cat r/*.sba >> robotron.512
cat r/*.sbb >> robotron.512
cat r/*.sbc >> robotron.512

# Combined 1024kbit image for a 27c010, switching on the high address line
cat joust.512 > dual.1024 
cat robotron.512 >> dual.1024
