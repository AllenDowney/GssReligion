#delimit ;

   infix
      year     1 - 20
      id_      21 - 40
      age      41 - 60
      gunlaw   61 - 80
      owngun   81 - 100
      rowngun  101 - 120
      cohort   121 - 140
      ballot   141 - 160
      wtssall  161 - 180
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable id_      "Respondent id number";
label variable age      "Age of respondent";
label variable gunlaw   "Favor or oppose gun permits";
label variable owngun   "Have gun in home";
label variable rowngun  "Does gun belong to r";
label variable cohort   "Year of birth";
label variable ballot   "Ballot used for interview";
label variable wtssall  "Weight variable";


label define gsp001x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp002x
   9        "No answer"
   8        "Don't know"
   2        "Oppose"
   1        "Favor"
   0        "Not applicable"
;
label define gsp003x
   9        "No answer"
   8        "Don't know"
   3        "Refused"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp004x
   9        "No answer"
   8        "Don't know"
   3        "Refused"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp005x
   9999     "No answer"
   0        "Not applicable"
;
label define gsp006x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;


label values age      gsp001x;
label values gunlaw   gsp002x;
label values owngun   gsp003x;
label values rowngun  gsp004x;
label values cohort   gsp005x;
label values ballot   gsp006x;


