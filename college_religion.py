from __future__ import print_function, division

import pandas as pd
import numpy as np

import thinkstats2
import thinkplot
import utils

import matplotlib.pyplot as plt
import seaborn as sns




def run(df):
    sample = utils.ResampleByYear(df)

    utils.fill_missing(sample, 'educ')
    sample['college'] = sample.educ >= 13

    utils.fill_missing(sample, 'relig')
    sample['none'] = sample.relig ==4

    grouped = sample.groupby(['year', 'college'])
    percent_none = grouped.none.mean().unstack()

    diff = percent_none[True] - percent_none[False]
    return diff

    


def main():
    gss = utils.ReadGss('gss_college_religion')
    diffs = [run(gss) for _ in range(101)]
    years = diffs[0].index

    rows = thinkstats2.PercentileRows(diffs, [5, 50, 95])
    thinkplot.fill_between(years, rows[0], rows[2], alpha=0.2)
    thinkplot.plot(years, rows[1])
    thinkplot.config(xlabel='Year', 
                     ylabel='Difference in fraction with no affiliation',
                     xlim=[1970, 2018])
    thinkplot.save(root='college_religion')


if __name__ == '__main__':
    main()
