Project proposal
================
Fan Li
October 14, 2021

# Problem / Question

There are many shooting incidents in New York city each year. Are the
occurrences of these shooting incidents random or do they show
space-time interactions? This project uses Knox statistical method to
test space-time clusters in New York city shooting incident each year
from 2006 to 2021. Finally map them according to layers grouped by year.

# Inspiring Examples

## Example 1

[Space-Time Clustering of Crime Events and Neighborhood Characteristics
in
Houston](https://heinonline-org.gate.lib.buffalo.edu/HOL/Page?lname=&public=false&collection=journals&handle=hein.journals/crmrev40&men_hide=false&men_tab=toc&kind=&page=340)

This example is a spatial-temporal interaction analysis of Houston
burglary and shooting crimes. The analysis of this study covers 12 super
neighborhoods in Houston’s southwest quadrant with Knox method for
space-time interaction. Unique clustering signatures of each type of
crime event is suggested in the findings.

![example01_screenshot](https://github.com/GEO511-2021/2021_case_studies-FanLukeLi/blob/master/week_07/example01.jpg)

This example is clear in the research question and has detailed
background research about spatial-temporal interactions of crime.
Therefore, this study could be referenced to suggest what variables and
statistics to look at in this project.

## Example 2

[A secondary Spatial Analysis of Gun Violence near Boston Schools: a
Public Health
Approach](https://openurl-ebsco-com.gate.lib.buffalo.edu/linksvc/linking.aspx?sid=mnh&volume=95&custid=s8461472&date=2018-6&spage=344&issn=1099-3460&stitle=&genre=article&issue=3&authtype=ip%2Cuid&title=Journal+of+urban+health.&epage=360)

Studies that explore concentrations of violence in areas proximal to
schools are fewer than researches that address violence at school.
Aiming to quantify the concentration of shootings near schools, the
study elucidated the place-based dynamics that may be focal points for
violence prevention by rejecting the null hypothesis of no spatial
dependence of shooting crimes.
![example02_screenshot](https://github.com/GEO511-2021/2021_case_studies-FanLukeLi/blob/master/week_07/example02.jpg)

This example is chosen because it uses statistical method to examine
locational patterns of firearm shootings at schools in Boston,
Massachusetts. Statistical analysis will be key to the spatial analysis
of this project. Referencing the statistical method used in this example
will help make progress in this project.

## Example 3

[Detecting spatial-temporal clusters of violent behavior in South Korea
with space-time permutation scan
statistics](https://www-emerald-com.gate.lib.buffalo.edu/insight/content/doi/10.1108/PIJPSM-07-2018-0085/full/html)

This study detects spatial-temporal clusters of violence in place of
interest using space-time permutation scan statistics (STPSS). A series
of experiments with different minimum and maximum temporal thresholds in
detecting clusters of violence were executed in this study. One model
among four was more representative of reality than other models.

![example03_screenshot](https://github.com/GEO511-2021/2021_case_studies-FanLukeLi/blob/master/week_07/example03.JPG)

This example is chosen because its comprehensive visualization of the
spatial-temporal clusters detected in the experiments. with plates using
different radius, the visualization of this study shows clearly the
positions and scales of the clusters detected in the experiments. This
very project could also use such comprehensive visualization of spatial
clusters.

# Proposed data sources

[NYPD Shooting Incident Data
(Historic)](https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8)

[NYPD Shooting Incident Data (Year To
Date)](https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Year-To-Date-/5ucz-vwe8)

These two datasets are from the site of [NYC
OpenData](https://opendata.cityofnewyork.us/).

# Proposed methods

A list of packages that will be used in this project may not be limited
to:

[maps](https://cran.r-project.org/web/packages/maps/)

[surveillance](https://cran.r-project.org/web/packages/surveillance)

[tidyverse](https://www.tidyverse.org/packages/)

[spData](https://cran.r-project.org/web/packages/spData/index.html)

[spatial](https://www.tidyverse.org/packages/)

The tidyverse, spData and spatial packages will be used to read, tidy
and manipulate the data into the form wanted. The maps package will be
used to map the shooting incident into scatter points on the census
tract map of New York city. The maps package will also be used to create
a choropleth map of number of incidents based on New York city census
tracts and clusters of incidents. The package surveillance will be used
on spatial analysis of the data, that is to perform Knox test to find
space-time interactions of the data.

# Expected results

This project is intended to perform Knox test analysis on shooting
incident data of New York city and map the clusters based on NYC census
tract. Expected production of this project include spatial statistics
report of Knox test, choropleth map of crime incidents in NYC and
clusters of crime incidents mapped onto census tract basemap of New York
city.
