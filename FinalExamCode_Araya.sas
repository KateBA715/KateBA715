* Final Exam for CTS2456C Fall 2022;
* Fill in the blanks so the program runs: _____;
* 1. SAVE AS the file FinalExamLASTNAME.sas so you can go
  back to the original if necessary.;
* 2. All blanks are the same size, 5 underscores, and do not
  indicate the number of characters (letters, numbers, symbols)
  that need to be replaced.;
* 3. Work incrementally by replacing blanks and selecting that
  piece of code to run. Don't try to fix all the blanks and
  then start running. Be sure to remove all of the blanks,

	  all 5 underscores, or your code will not compile and run.;
* START WITH THE %let and LIBNAME statements! SELECT these
* two lines of code and run them first.;
* 4. Feel free to add comments. You can add code (PROC PRINT
  or PROC CONTENTS) as you need to. When finished you should
  have 3 datasets in the WORK library.;
* 5. Download your FinalExamLastname.sas file to your computer
  and upload it to the question on the final exam.


	* Please do not edit the macro declared below;
%let path=~/my_shared_file_links/pamelabrauda0/FinalExamFall2022;
LIBNAME sasfinal "&path";
* The local school district has a SAS data set called DISTRICT that
contains the rubric used for classifying teachers' annual eval-
uations. The rubric is based on two components: a teacher score
and a curriculum grade. Using these components, an overall rating
for the teacher can be determined. The data for 10 elementary school
teachers who are due for evaluation are stored in the SAS data set
called TEACHERS.;
* Part 1a) Examine these SAS data sets including the variable labels
and attributes. Combine the two SAS data sets with a DATA step so
that the district rating is properly assigned to each teacher. Also

	eliminate any observation that does not match to a teacher.;

PROC SORT DATA=sasfinal.teachers OUT=teachersort;
	BY TeacherScore CurriculumGrd;
RUN;

DATA rate;
	SET sasfinal.district (RENAME=(TS=TeacherScore CG=CurriculumGrd))
		teachersort (IN=Tdat);
	KEEP TeacherScore CurriculumGrd;

	IF Tdat= RATING;
RUN;

* Part 1b) Sort the resulting data set by teacher name so that

	administrators can easily locate each teacher's rating.;

PROC SORT DATA=rate;
	BY TEACHER;
RUN;

* Part 2) Repeat Parts 1a & 1b using PROC SQL;

PROC SQL;
	SELECT TABLE rate2 AS _____ * _____ sasfinal.district, sasfinal.teachers WHERE 
		TS=TeacherScore ___ CG=_____ ORDER BY _____;
	_____;