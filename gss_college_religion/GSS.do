#delimit ;

   infix
      year     1 - 20
      id_      21 - 40
      educ     41 - 60
      relig    61 - 80
      ballot   81 - 100
      wtssall  101 - 120
      age      121 - 140
      cohort   141 - 160
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable id_      "Respondent id number";
label variable educ     "Highest year of school completed";
label variable relig    "Rs religious preference";
label variable ballot   "Ballot used for interview";
label variable wtssall  "Weight variable";
label variable age      "Age of respondent";
label variable cohort   "Year of birth";


label define gsp001x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp002x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp003x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp004x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp005x
   9999     "No answer"
   0        "Not applicable"
;


label values educ     gsp001x;
label values relig    gsp002x;
label values ballot   gsp003x;
label values age      gsp004x;
label values cohort   gsp005x;


