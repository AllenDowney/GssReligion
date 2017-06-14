from __future__ import print_function, division

import pandas as pd
import numpy as np

import thinkstats2
import thinkplot
import utils

import statsmodels.formula.api as smf
import matplotlib.pyplot as plt

import seaborn as sns
sns.set(style='whitegrid', font_scale=1.5)

RED, BLUE, GREEN, PURPLE, ORANGE, YELLOW = sns.color_palette('Set1')


def create_relig_vars(df):
    """Creates columns for religious categories.
    
    df: DataFrame
    """
    # lumping "Christian" with Protestant
    df['prot'] = (df.relig.isin([1,11]))

    # lumping "Orthodox-Christian" with Catholic
    df['cath'] = (df.relig.isin([2,10]))
    df['none'] = (df.relig==4)
    df['other'] = (df.relig.isin([3,5,6,7,8,9,12,13]))
    
    df['relig4'] = df.relig.copy()
    df.relig4.replace([10, 11], 1, inplace=True)
    df.relig4.replace([5,6,7,8,9,12,13], 3, inplace=True)

    varnames = ['prot', 'cath', 'none', 'other']
    df.loc[df.relig.isnull(), varnames + ['relig4']] = np.nan
    

def create_belief_vars(df):
    """Creates columns for belief categories.
    
    df: DataFrame
    """
    df['nobelief'] = (df.god.isin([1, 2]))
    df['belief'] = (df.god.isin([3, 4, 5]))
    df['strongbelief'] = (df.god.isin([6]))
    
    df['belief3'] = df.god.copy()
    df.belief3.replace([1, 2], 1, inplace=True)
    df.belief3.replace([3, 4, 5], 2, inplace=True)
    df.belief3.replace([6], 3, inplace=True)

    varnames = ['strongbelief', 'belief', 'nobelief', 'belief3']
    df.loc[df.god.isnull(), varnames] = np.nan
    

def create_conf_vars(df):
    """Creates columns for confidence in religion categories.
    
    df: DataFrame
    """
    df['confident'] = (df.conclerg == 1)
    df['someconf'] = (df.conclerg == 2)
    df['noconf'] = (df.conclerg == 3)

    varnames = ['confident', 'someconf', 'noconf']
    df.loc[df.conclerg.isnull(), varnames] = np.nan
    

def create_bible_vars(df):
    """Creates columns for bible interpretation categories.
    
    df: DataFrame
    """
    df['literal'] = (df.bible == 1)
    df['inspired'] = (df.bible == 2)
    df['legends'] = (df.bible == 3)

    varnames = ['inspired', 'literal', 'legends']
    df.loc[df.bible.isnull(), varnames] = np.nan
    

def center_factors(df):
    """Center factors around their means.
    
    Add centered factors for the model.
    
    df: DataFrame
    """
    df['ones'] = np.ones_like(df.cohort)
    df['c'] = df.cohort - 1966
    df['c2'] = df.c**2
    df['a'] = df.age - 47
    df['a2'] = df.a**2
    df['ac'] = df.a * df.c


def plot_relig(grouped, varnames):
    """Plot one line for each religious group.
    
    grouped: GroupBy object with one-hots for each religious group
    """
    colors = [ORANGE, GREEN, RED, BLUE]
    labels = ['Protestant', 'Catholic', 'None', 'Other']
    series_seq = make_series_seq(grouped, varnames)
    plot_series_seq(series_seq, colors, labels)


def read_gss():
    """Read and clean GSS data.

    returns: DataFrame
    """
    gss = utils.ReadGss('gss_religion_data')

    # replace special values with NaN
    gss.age.replace([98, 99], np.nan, inplace=True)
    gss.cohort.replace([9999], np.nan, inplace=True)
    gss.relig.replace([98, 99], np.nan, inplace=True)
    gss.bible.replace([4, 8, 9, 0], np.nan, inplace=True)
    gss.conclerg.replace([8, 9, 0], np.nan, inplace=True)
    gss.god.replace([8, 9, 0], np.nan, inplace=True)

    # remove rows with missing data
    gss.dropna(subset=['age', 'cohort', 'relig'], inplace=True)

    # compute age groups and cohorts
    #gss['age_group'] = utils.RoundIntoBins(gss, 'age', 5, 90)
    #gss['decade'] = utils.RoundIntoBins(gss, 'cohort', 10)
    gss['cohort5'] = utils.RoundIntoBins(gss, 'cohort', 5, low=4) + 2.5

    # recode variables
    create_relig_vars(gss)
    create_belief_vars(gss)
    create_conf_vars(gss)
    create_bible_vars(gss)

    # compute centered factors for regression
    center_factors(gss)
    
    return gss


def make_series_df(grouped, varnames):
    """Compute the percentage in each category.
    
    grouped: GroupBy object with one-hots for each category
    varnames: list of string column names
    
    returns: DataFrame
    """
    df = pd.DataFrame(columns=varnames)
    for var in varnames:
        df[var] = grouped[var].mean() * 100
    return df


def plot_series_seq(series_seq, colors, labels):
    """Plots Series objects.
    
    series_seq: list of Series
    colors: list of string colors
    labels: list of string labels
    """
    for series, color, label in zip(series_seq, colors, labels):
        thinkplot.plot(series, color=color, label=label)


def plot_relig(grouped):
    """Plot one line for each religious group.
    
    grouped: GroupBy object with one-hots for each religious group
    """
    varnames = ['prot', 'cath', 'none', 'other']
    colors = [ORANGE, GREEN, RED, BLUE]
    labels = ['Protestant', 'Catholic', 'None', 'Other']
    series_seq = make_series_seq(grouped, varnames)
    plot_series_seq(series_seq, colors, labels)


def run(df):
    """Resample and run the analysis.

    df: DataFrame
    """
    sample = utils.ResampleByYear(df)





def main():
    gss = read_gss()
    sample = utils.ResampleByYear(gss)
    grouped_year = sample.groupby(['year'])
    plot_relig(grouped_year)
    thinkplot.config(xlabel='Year of survey', ylabel='Percent')
    thinkplot.show()
    return

    # run the resamples
    dfs = [run(gss) for _ in range(101)]

    # make the plots
    single_plot(dfs)
    multi_plot(dfs)



if __name__ == '__main__':
    main()
