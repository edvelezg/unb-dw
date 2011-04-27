#!/usr/bin/env python
import sys
import re

len = 100
wid = 50

def findmax( mya=4, myb=10 ):
  myarr = (len*myb , len*(wid-myb), wid*mya, wid*(len-mya))
  print max(myarr)
    
#mya = int(sys.argv[1])
#myb = int(sys.argv[2])
#findmax(mya, myb)

with open('input.txt', 'r') as f:
    arr = f.readlines()
    for elem in arr:
        elem = elem.rstrip()
        pair = elem.split(' ')
        if pair.__len__() > 1:
            mya = int(pair[0])
            myb = int(pair[1])
            findmax(mya, myb)
f.closed
