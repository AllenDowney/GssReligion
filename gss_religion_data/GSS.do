#delimit ;

   infix
      year     1 - 20
      conclerg 21 - 40
      bible    41 - 60
      cohort   61 - 80
      age      81 - 100
      wtssall  101 - 120
      ballot   121 - 140
      relig    141 - 160
      educ     161 - 180
      id_      181 - 200
      god      201 - 220
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable conclerg "Confidence in organized religion";
label variable bible    "Feelings about the bible";
label variable cohort   "Year of birth";
label variable age      "Age of respondent";
label variable wtssall  "Weight variable";
label variable ballot   "Ballot used for interview";
label variable relig    "Rs religious preference";
label variable educ     "Highest year of school completed";
label variable id_      "Respondent id number";
label variable god      "Rs confidence in the existence of god";


label define gsp001x
   9        "No answer"
   8        "Don't know"
   3        "Hardly any"
   2        "Only some"
   1        "A great deal"
   0        "Not applicable"
;
label define gsp002x
   9        "No answer"
   8        "Don't know"
   4        "Other"
   3        "Book of fables"
   2        "Inspired word"
   1        "Word of god"
   0        "Not applicable"
;
label define gsp003x
   9999     "No answer"
   0        "Not applicable"
;
label define gsp004x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp005x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp006x
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
label define gsp007x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp008x
   9        "No answer"
   8        "Don't know"
   6        "Know god exists"
   5        "Believe but doubts"
   4        "Believe sometimes"
   3        "Some higher power"
   2        "No way to find out"
   1        "Dont believe"
   0        "Not applicable"
;


label values conclerg gsp001x;
label values bible    gsp002x;
label values cohort   gsp003x;
label values age      gsp004x;
label values ballot   gsp005x;
label values relig    gsp006x;
label values educ     gsp007x;
label values god      gsp008x;


