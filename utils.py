from __future__ import print_function, division

import pandas as pd
import numpy as np

import thinkstats2
import thinkplot

import statsmodels.formula.api as smf


def ReadGss(dirname):
    """Reads GSS files from the given directory.
    
    dirname: string
    
    returns: DataFrame
    """
    dct = thinkstats2.ReadStataDct(dirname + '/GSS.dct')
    gss = dct.ReadFixedWidth(dirname + '/GSS.dat')
    return gss


def ResampleByYear(df, column='wtssall'):
    """Resample rows within each year.
    
    df: DataFrame
    column: string name of weight variable
    
    returns DataFrame
    """
    grouped = df.groupby('year')
    samples = [thinkstats2.ResampleRowsWeighted(group, column) 
               for _, group in grouped]
    sample = pd.concat(samples, ignore_index=True)
    return sample


def values(df, varname):
    """Values and counts in index order.
    
    df: DataFrame
    varname: strign column name
    
    returns: Series that maps from value to frequency
    """
    return df[varname].value_counts().sort_index()


def fill_missing(df, varname, badvals=[98, 99]):
    """Fill missing data with random values.
    
    df: DataFrame
    varname: string column name
    badvals: list of values to be replaced
    """
    df[varname].replace(badvals, np.nan, inplace=True)
    null = df[varname].isnull()
    fill = np.random.choice(df[varname].dropna(), sum(null), replace=True)
    df.loc[null, varname] = fill
    return sum(null)


def RoundIntoBins(df, var, bin_width, high=None, low=0):
    """Rounds values down to the bin they belong in.

    df: DataFrame
    var: string variable name
    bin_width: number, width of the bins

    returns: array of bin values
    """
    if high is None:
        high = df[var].max()

    bins = np.arange(low, high+bin_width, bin_width)
    indices = np.digitize(df[var], bins)
    return bins[indices-1]
