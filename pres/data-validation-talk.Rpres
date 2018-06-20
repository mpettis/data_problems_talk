<style>
.reveal h1, .reveal h2, .reveal h3 {
  word-wrap: normal;
  -moz-hyphens: none;
}
</style>

You Don't Get Nice Things: Real Data Problems in Data Science
========================================================
author: Matt Pettis
date: June 5, 2018
autosize: true




About Me
========================================================

- Principal Data Scientist, Honeywell
- Data science experience in IT, retail, and manufacturing
- Occasional speaker at Twin Cities R User Group Meeting

***
Finding me:
- Email: matthew.pettis@gmail.com
- Twitter: @mtpettis
- Github: mpettis
- LinkedIn: Matt Pettis




Resources
========================================================
* https://github.com/mpettis/data_problems_talk




Your Data
========================================================
<div align="center">
<img src="delightc.jpg" width=660 height=440>
</div>

Hieronymus Bosch, *The Garden of Earthly Delights*


Take an Athletic Stance
========================================================
<div align="center">
<img src="sumo.jpg" width=800 height=600>
</div>



Headache : Zip file Inception
========================================================
incremental: true
* You get a zipfile
* Which contains a set of zipfiles
* Each of those zipfiles contains zipfiles
* ... and so on



Headache : Zip file Inception
========================================================
<div align="center">
<img src="yo-dawg-zipfile.jpg" width=800 height=600>
</div>



Remedy : Zip file Inception
========================================================
incremental: true

* Big idea: You will have to repeat this process -- get a tool for it.
* Learn to script : bash, python, R, Perl.
* GUI point-and-click on this is not reliable at scale.
* [see bash script on this]



Headache : Inconsistent naming conventions
========================================================
incremental: true

* You may see Months of data with filenames like this:
    * Jan18.csv
    * 2018-February.csv
    * 2018-03.csv
    * The-Cruelest-Month.csv
    * 04 (May) 2018.csv
* These people are monsters for naming things like this...



Remedy : Inconsistent naming conventions
========================================================
incremental: true

* In all likelyhood, none for your current task.
* If really important, you may be able to rename.
    * If date in data, and data is monthly, script a rename.
* Socially engineer for the future.
    * Jenny Bryan, RStudio: http://www2.stat.duke.edu/~rcs46/lectures_2015/01-markdown-git/slides/naming-slides/naming-slides.pdf



Headache : CSV column names with non-standard characters
========================================================
incremental: true

* Tables in Excel often get characters, such as newlines.
* This makes these names hard to deal with in code, both as strings and codenames.



Remedy : CSV column names with non-standard characters
========================================================
incremental: true

* Code that strips problematic characters exist in R and Python.
* Keep a mapping of original, messy names to new fixed names.






Headache : Missing and outlying data
========================================================
incremental: true

* Know what you should expect from each data feature.
* Know where your data goes off the rails.
* Knowing your data is a hallmark of competency in many areas of life...



Remedy : Missing and outlying data
========================================================
incremental: true

* Packages that summarize this information.
* When possible, put this information at your fingertips.
    * Decimal equivalents of common fractions.
    * Common conversions (minutes and seconds in day, hours in week)
    * Reasonable magnitudes, units, and dimensions
    * Ways to reason quickly (https://mitpress.mit.edu/books/street-fighting-mathematics)






Headache : Time series with missing entries
========================================================
incremental: true

* Some models require equispaced, non-missing time series data.
* Do you have that in your data?



Remedy : Time series with missing entries
========================================================
incremental: true

* Know how to script detection of missing entries.
* Know how to script creation of equispaced time series data.












Headache : Nested JSON in columns
========================================================
incremental: true

Zen of Python

```
...
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
...
```

... Nested JSON kills the flatness aspiration.



Remedy : Nested JSON in columns
========================================================
incremental: true

* R and Python tools can flatten these structures.







Summary
========================================================
* Get a style
* Be opinionated
* ... but be kind


Resources (Repeat)
========================================================
* https://github.com/mpettis/data_problems_talk
