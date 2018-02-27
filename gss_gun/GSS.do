#delimit ;

   infix
      year     1 - 20
      ballot   21 - 40
      cohort   41 - 60
      rowngun  61 - 80
      owngun   81 - 100
      gunlaw   101 - 120
      polviews 121 - 140
      age      141 - 160
      id_      161 - 180
      wtssall  181 - 200
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable ballot   "Ballot used for interview";
label variable cohort   "Year of birth";
label variable rowngun  "Does gun belong to r";
label variable owngun   "Have gun in home";
label variable gunlaw   "Favor or oppose gun permits";
label variable polviews "Think of self as liberal or conservative";
label variable age      "Age of respondent";
label variable id_      "Respondent id number";
label variable wtssall  "Weight variable";


label define gsp001x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp002x
   9999     "No answer"
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
   9        "No answer"
   8        "Don't know"
   2        "Oppose"
   1        "Favor"
   0        "Not applicable"
;
label define gsp006x
   9        "No answer"
   8        "Don't know"
   7        "Extrmly conservative"
   6        "Conservative"
   5        "Slghtly conservative"
   4        "Moderate"
   3        "Slightly liberal"
   2        "Liberal"
   1        "Extremely liberal"
   0        "Not applicable"
;
label define gsp007x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;


label values ballot   gsp001x;
label values cohort   gsp002x;
label values rowngun  gsp003x;
label values owngun   gsp004x;
label values gunlaw   gsp005x;
label values polviews gsp006x;
label values age      gsp007x;


