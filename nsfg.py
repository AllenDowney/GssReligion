"""This file contains code for use with "Think Stats",
by Allen B. Downey, available from greenteapress.com

Copyright 2010 Allen B. Downey
License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
"""

from __future__ import print_function, division

from collections import defaultdict
import numpy as np
import sys
import pandas

import thinkstats2


def ReadMale2002(dct_file='2002Male.dct',
                 dat_file='2002Male.dat.gz'):
    """Reads male data from NSFG Cycle 6.

    returns: DataFrame
    """
    dct = thinkstats2.ReadStataDct(dct_file, encoding='iso-8859-1')
    male = dct.ReadFixedWidth(dat_file, compression='gzip')
    CleanResp(male)
    return male


def ReadFemResp2002(dct_file='2002FemResp.dct',
                    dat_file='2002FemResp.dat.gz'):
    """Reads respondent data from NSFG Cycle 6.

    returns: DataFrame
    """
    usecols = ['caseid', 'cmbirth', 'cmintvw', 'finalwgt', 'age_r']
    dct = thinkstats2.ReadStataDct(dct_file, encoding='iso-8859-1')
    resp = dct.ReadFixedWidth(dat_file, compression='gzip', usecols=usecols)
    CleanResp(resp)
    return resp


def ReadFemPreg2002(dct_file='2002FemPreg.dct',
                    dat_file='2002FemPreg.dat.gz'):
    """Reads the NSFG pregnancy data.

    dct_file: string file name
    dat_file: string file name

    returns: DataFrame
    """
    dct = thinkstats2.ReadStataDct(dct_file)
    resp = dct.ReadFixedWidth(dat_file, compression='gzip')
    CleanFemPreg(resp)
    return resp


def ReadFemResp2010():
    """Reads respondent data from NSFG Cycle 7.

    returns: DataFrame
    """
    usecols = ['cmmarrhx', 'cmdivorcx', 'cmbirth', 'cmintvw',
               'evrmarry', 'wgtq1q16']
    resp = ReadFemResp('2006_2010_FemRespSetup.dct',
                        '2006_2010_FemResp.dat.gz',
                        usecols=usecols)
    resp['finalwgt'] = resp.wgtq1q16
    CleanResp(resp)
    return resp


def ReadMale2010(dct_file='2006_2010_MaleSetup.dct',
                 dat_file='2006_2010_Male.dat.gz'):
    """Reads male data from NSFG Cycle 7.

    returns: DataFrame
    """
    dct = thinkstats2.ReadStataDct(dct_file, encoding='iso-8859-1')
    male = dct.ReadFixedWidth(dat_file, compression='gzip')

    male['finalwgt'] = male.wgtq1q16

    return male


def ReadFemResp2013():
    """Reads respondent data from NSFG Cycle 8.

    returns: DataFrame
    """
    usecols = ['cmmarrhx', 'cmdivorcx', 'cmbirth', 'cmintvw',
               'evrmarry', 'wgt2011_2013']
    resp = ReadFemResp('2011_2013_FemRespSetup.dct',
                        '2011_2013_FemRespData.dat.gz',
                        usecols=usecols)
    resp['finalwgt'] = resp.wgt2011_2013
    CleanResp(resp)
    return resp


def ReadFemResp1995():
    """Reads respondent data from NSFG Cycle 5.

    returns: DataFrame
    """
    dat_file = '1995FemRespData.dat.gz'
    names = ['a_doi', 'timesmar', 'mardat01', 'bdaycenm', 'post_wt']
    colspecs = [(12359, 12363),
                (3538, 3540),
                (11758, 11762),
                (13, 16),
                (12349, 12359)]
    resp = pandas.read_fwf(dat_file, 
                         compression='gzip', 
                         colspecs=colspecs, 
                         names=names)

    resp['cmmarrhx'] = resp.mardat01
    resp['cmbirth'] = resp.bdaycenm
    resp['cmintvw'] = resp.a_doi
    resp['finalwgt'] = resp.post_wt

    resp.timesmar.replace([98, 99], np.nan, inplace=True)
    resp['evrmarry'] = (resp.timesmar > 0).astype(int)

    CleanResp(resp)
    return resp


def CleanResp(resp):
    """Cleans a respondent DataFrame.

    resp: DataFrame of respondents
    """
    resp['age'] = (resp.cmintvw - resp.cmbirth).astype(int) // 12

    month0 = pandas.to_datetime('1899-12-15')
    dates = [month0 + pandas.DateOffset(months=cm) 
             for cm in resp.cmbirth]
    resp['decade'] = (pandas.DatetimeIndex(dates).year - 1900) // 10


def CleanFemPreg(preg):
    """Recodes variables from the pregnancy frame.

    preg: DataFrame
    """
    # mother's age is encoded in centiyears; convert to years
    preg.agepreg /= 100.0

    # birthwgt_lb contains at least one bogus value (51 lbs)
    # replace with NaN
    preg.birthwgt_lb[preg.birthwgt_lb > 20] = np.nan
    
    # replace 'not ascertained', 'refused', 'don't know' with NaN
    na_vals = [97, 98, 99]
    preg.birthwgt_lb.replace(na_vals, np.nan, inplace=True)
    preg.birthwgt_oz.replace(na_vals, np.nan, inplace=True)
    preg.hpagelb.replace(na_vals, np.nan, inplace=True)

    preg.babysex.replace([7, 9], np.nan, inplace=True)
    preg.nbrnaliv.replace([9], np.nan, inplace=True)

    # birthweight is stored in two columns, lbs and oz.
    # convert to a single column in lb
    # NOTE: creating a new column requires dictionary syntax,
    # not attribute assignment (like preg.totalwgt_lb)
    preg['totalwgt_lb'] = preg.birthwgt_lb + preg.birthwgt_oz / 16.0    

    preg.cmintfin.replace([9998, 9999], np.nan, inplace=True)

    # due to a bug in ReadStataDct, the last variable gets clipped;
    # so for now set it to NaN
    preg.cmintvw = np.nan


def MakePregMap(df):
    """Make a map from caseid to list of preg indices.

    df: DataFrame

    returns: dict that maps from caseid to list of indices into preg df
    """
    d = defaultdict(list)
    for index, caseid in df.caseid.iteritems():
        d[caseid].append(index)
    return d


def ProcessMales(male):
    chdob_cols = [col for col in male.columns if col.startswith('cmchdob')]
    chdob = male[chdob_cols]
    chdob.replace([9998, 9999], np.nan, inplace=True)
    
    subset = male[['religion', 'cmbirth', 'finalwgt', 'age']]

    for i, religion in male.religion.iteritems():
        num_kids = male.evrchiln.loc[i]
        dobs = chdob.loc[i].dropna()
        dobs.sort()
        age_at_births = (dobs - male.cmbirth.loc[i]) / 12.0
        if len(dobs) > 1 and len(dobs) != num_kids:
            print(i, religion, age_at_births.values, num_kids)


def main(script):
    """Tests the functions in this module.

    script: string script name
    """
    male = ReadMale2002()
    ProcessMales(male)


if __name__ == '__main__':
    main(*sys.argv)
