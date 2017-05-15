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
plt.figure(figsize=(8, 6))



age_groups = np.linspace(20, 60, 5, endpoint=True)
colors = sns.color_palette()
labels = ['20-29', '30-39', '40-49', '50-59', '60-69']
xlabel = 'Year'
ylabel = 'Fraction with no affiliation'
axis = [1971, 2017, 0, 0.35]

def single_plot(dfs):
    """Make the plot.
    """
    for i, age_group in enumerate(age_groups):
        print(i, age_group)
        series = [df.loc[age_group] for df in dfs]
        models = [fit_row(s).fittedvalues for s in series]
        xs = series[0].index + 2

        rows = thinkstats2.PercentileRows(models, [5, 95])
        thinkplot.fill_between(xs, rows[0], rows[1], 
                               color=colors[i], alpha=0.3)

        rows = thinkstats2.PercentileRows(series, [50])
        thinkplot.plot(xs, rows[0], label=labels[i], 
                       color=colors[i], alpha=0.6)

    thinkplot.config(xlabel=xlabel, ylabel=ylabel, 
                     loc='upper left', axis=axis)
    plt.gca().get_legend().set(title='Age group');
    thinkplot.save(root='age_religion2')



def read_gss():
    gss = utils.ReadGss('gss_college_religion')

    # remove rows with missing data
    gss.age.replace([98, 99], np.nan, inplace=True)
    gss.cohort.replace([9999], np.nan, inplace=True)
    gss.relig.replace([98, 99], np.nan, inplace=True)
    print(sum(gss.age.isnull()))

    gss.dropna(subset=['age', 'cohort', 'relig'], inplace=True)

    # compute age groups and decade of birth
    gss['age_group10'] = utils.RoundIntoBins(gss, 'age', 10)
    gss['year4'] = utils.RoundIntoBins(gss, 'year', 4, low=2)
    gss['none'] = (gss.relig == 4)
    
    return gss



def run(df):
    sample = utils.ResampleByYear(df)

    grouped = sample.groupby(['age_group10', 'year4'])
    counts = grouped.none.count().unstack()

    percent_none = grouped.none.mean().unstack()
    percent_none[counts < 50] = np.nan

    return percent_none


def fit_row(row, formula='y ~ time + time2'):
    """Fits a model to a Series.
    
    row: Series
    formula: Patsy string
    
    returns: RegressionResults
    """

    time = row.index
    time -= min(time)
    time2 = time**2
    
    df = pd.DataFrame(dict(time=time, time2=time2, y=row))
    results = smf.ols(formula, data=df).fit()
    return results


def main():
    gss = read_gss()
    
    # run the resamples
    dfs = [run(gss) for _ in range(101)]

    single_plot(dfs)


if __name__ == '__main__':
    main()
