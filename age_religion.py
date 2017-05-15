from __future__ import print_function, division

import pandas as pd
import numpy as np

import thinkstats2
import thinkplot
import utils

import statsmodels.formula.api as smf
import matplotlib.pyplot as plt

import seaborn as sns
sns.set(style='white', font_scale=1.5)

decades = np.linspace(1980, 1930, 6, endpoint=True)
colors = sns.color_palette()
labels = ['80s', '70s', '60s', '50s', '40s', '30s']
xlabel = 'Age group'
ylabel = 'Fraction with no affiliation'
axis = [13, 82, 0, 0.32]


def single_plot(dfs):
    plt.figure(figsize=(8, 6))

    for i, decade in enumerate(decades):
        series = [df.loc[decade] for df in dfs]
        xs = series[0].index

        rows = thinkstats2.PercentileRows(series, [5, 50, 95])
        thinkplot.fill_between(xs, rows[0], rows[2], 
                               color=colors[i], alpha=0.1)
        thinkplot.plot(xs, rows[1], label=labels[i], 
                       color=colors[i], alpha=0.8)

    thinkplot.config(axis=axis, xlabel=xlabel, ylabel=ylabel)
    plt.gca().get_legend().set(title='Decade born');
    thinkplot.save(root='age_religion1')


def multi_plot(dfs):
    plt.figure(figsize=(8, 6))

    xlabels = ['', '', '', xlabel, xlabel, xlabel]
    ylabels = [ylabel, '', '', ylabel, '', '']

    thinkplot.figure(figsize=(11, 8))
    thinkplot.preplot(num=6, rows=2, cols=3)

    for i, decade in enumerate(decades):
        series = [df.loc[decade] for df in dfs]
        xs = series[0].index
        rows = thinkstats2.PercentileRows(series, [5, 50, 95])

        thinkplot.subplot(i+1)
        thinkplot.fill_between(xs, rows[0], rows[2], 
                               color=colors[i], alpha=0.1)
        thinkplot.plot(xs, rows[1], label=labels[i], 
                       color=colors[i], alpha=0.8)

        thinkplot.config(axis=axis, xlabel=xlabels[i], ylabel=ylabels[i])

    thinkplot.save(root='age_religion2')


def run(df):
    """Resample and run the analysis.

    df: DataFrame
    """
    sample = utils.ResampleByYear(df)

    grouped = sample.groupby(['decade', 'age_group'])
    counts = grouped.none.count().unstack()

    percent_none = grouped.none.mean().unstack()
    percent_none[counts < 50] = np.nan

    return percent_none


def read_gss():
    gss = utils.ReadGss('gss_college_religion')

    # remove rows with missing data
    gss.age.replace([98, 99], np.nan, inplace=True)
    gss.cohort.replace([9999], np.nan, inplace=True)
    gss.relig.replace([98, 99], np.nan, inplace=True)
    print(sum(gss.age.isnull()))

    gss.dropna(subset=['age', 'cohort', 'relig'], inplace=True)

    # compute age groups and decade of birth
    gss['age_group'] = utils.RoundIntoBins(gss, 'age', 5, 90)
    gss['decade'] = utils.RoundIntoBins(gss, 'cohort', 10)
    gss['none'] = (gss.relig == 4)

    return gss


def main():
    gss = read_gss()

    # run the resamples
    dfs = [run(gss) for _ in range(101)]

    # make the plots
    single_plot(dfs)
    multi_plot(dfs)



if __name__ == '__main__':
    main()
