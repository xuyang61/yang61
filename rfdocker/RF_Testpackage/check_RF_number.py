#!/usr/bin/env python3

import re

# check validity of individual generated reference number generated on
# https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri

def rf_ref_number_is_valid(refnum, base=''):
    # check that the prefix is "RF"
    if refnum[0:2] != 'RF':
        return False

    # check that after every group of four characters there's a space
    if any(c != ' ' for c in refnum[4::5]):
        return False

    # create machine reference number by removing spaces
    machnum = re.sub(' ', '', refnum)

    # Finnish reference number + RFxx should be at most 24 characters
    if len(machnum) > 24:
        return False

    # only digits allowed after "RF"
    if any(not c.isdigit() for c in machnum[2:]):
        return False

    # reorder reference number, characters from fifth onwards first,
    # then four on the beginning
    reordered = machnum[4:] + machnum[:4]

    # Finnish reference number part should not start with zero
    # with the exception of minimal RF04 00
    if len(machnum) > 6 and reordered[0] == '0':
        return False

    # optional: check that base of reference number matches
    if not reordered.startswith(base):
        return False

    # Finnish reference format, ISO 11649 letter translation
    noletters = re.sub('RF', '2715', reordered)

    # convert to number, invalid if it fails
    try:
        numeric = int(noletters)
    except:
        return False

    # remainder modulo 97 must be 1
    return numeric % 97 == 1
